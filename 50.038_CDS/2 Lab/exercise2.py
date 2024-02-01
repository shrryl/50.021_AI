# Importing libraries
import numpy as np
import pandas as pd
# given
terms_1 = pd.Series(['this', 'is', 'a', 'sample'])
count_1 = pd.Series([1,1,2,1])
doc_1 = pd.DataFrame({ 'Term': terms_1, 'Count': count_1 })

terms_2 = pd.Series(['this', 'is', 'another', 'sample'])
count_2 = pd.Series([1,1,2,3])
doc_2 = pd.DataFrame({ 'Term': terms_2, 'Count': count_2 })

# Add a new column tf term freq
doc_1['Term Frequency'] = doc_1['Count']/doc_1['Count'].sum()
doc_2['Term Frequency'] = doc_2['Count']/doc_2['Count'].sum()
# write function tf-idf(w,d) = tf * log2 (2/ df of word)
def tf_idf_score(w, d):
    # check document frequency of word (how many times it appears in each doc)  
    print("calculating tf-idf score for the word: '", w, "' in ", d) 
    df = 0
    tf_idf = 0
    in_doc_1 = False
    in_doc_2 = False

    if doc_1['Term'].eq(w).any():
        in_doc_1 = True
    if doc_2['Term'].eq(w).any():
        in_doc_2 = True
    
    if in_doc_1 & in_doc_2:
        print("word appears in both documents") # not very helpful
        df = 2
    elif in_doc_1 | in_doc_2:
        df = 1
    else:
        df = 0
        print("word does not appear in either document")
        return 0
    
    # calculate score
    if (d == 'd1') & in_doc_1:
        tf_idf = doc_1.loc[doc_1['Term'] == w, 'Term Frequency'].iloc[0] * np.log2(2/df)
    elif (d == 'd2') & in_doc_2:
        tf_idf = doc_2.loc[doc_2['Term'] == w, 'Term Frequency'].iloc[0] * np.log2(2/df)
    else:
        print("word does not appear in this document")
        return 0
    print("tf-idf score:", tf_idf)
    return tf_idf

# check result
tf_idf_score('this','d2')
tf_idf_score('is','d1')
tf_idf_score('a','d1')
tf_idf_score('another','d1')
tf_idf_score('another','d2')
tf_idf_score('sample','d2')