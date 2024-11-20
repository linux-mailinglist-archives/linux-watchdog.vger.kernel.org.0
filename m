Return-Path: <linux-watchdog+bounces-2463-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6DE9D379B
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 10:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7973FB21B80
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 09:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA15F19D080;
	Wed, 20 Nov 2024 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TyMmhvof"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEDA19AA68;
	Wed, 20 Nov 2024 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096363; cv=none; b=HzA084l0qPmTPWIJfca/LakU2tIsZhjMQ6ootF/hhs5AvDOyT5gwXw4yiYgkRuut1oR9ZCqsPTSfrXZMtycwi2YvW8jiz/Wgj8ENY7dDkOF7EeoBCJ8917/Vf1pRGUDo18+gqoks0IKGAzAAWknFkSr9hyrl2I53KzmspUcDhZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096363; c=relaxed/simple;
	bh=oTjxLSyLUSDWUqEL4U89tgmhSivPbNqKBql5iY5FXnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bLwPGuAjjFkEcNoZtuu4e327J8tutnhYLVJvcRJAeAfzN7uWyvhDFU4k0gLs5o1MKNO6rvMHLg+IuxexcUldhpo56nJfm2VcO1LpvGhBsxv/5R3HLKQiqQHp0bVKxx3XLJT0yaYuiFETNfcyp6JV3L43zkwnqxBtan+G2HKo+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TyMmhvof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FT9B005743;
	Wed, 20 Nov 2024 09:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0302W7DdnTeDi5GvqZgRf9A+n5FM0dF6jQPmr+WzZ8=; b=TyMmhvofTo8CYN/D
	rCSnuLbLRiwECV/WCXX2G1rfiF7Qp7EizdNKvHNY+RZ8EjzXoVPwzA8/mr3pFWY+
	781Bt55zyBLPVmbYNc4eGFoLI2vMGVItaEIXq0Pk36sroaqEl1xGMQRs6UzdYnzd
	u8DUAFoHjLtRFA1mf7ZysR8cWcDbchQob0GkPG7mILFaTls42Q08OivLdmkITy3v
	8dIND/0/DgpaubugKIrXRFYdVUgUBYHlqoeBbYTTrS+9ABsMxUP9rWEPNYywoMUT
	7USrmKTMq5MGeh9z3fbNE3IQWgHZ7ZrnSYfZUSmep4D1GoCptegU1bJUdUeFeWFv
	jhTVsg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7wemx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:52:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK9qNVa014018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:52:23 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 01:52:18 -0800
Message-ID: <48bf0cde-42e2-4032-a71c-3f9d43d02385@quicinc.com>
Date: Wed, 20 Nov 2024 15:22:15 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Add watchdog node
To: Krzysztof Kozlowski <krzk@kernel.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <quic_rjendra@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
 <20241120055248.657813-3-quic_mmanikan@quicinc.com>
 <e134af10-4d58-4bee-9de2-80c120ca8a02@kernel.org>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <e134af10-4d58-4bee-9de2-80c120ca8a02@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PhuqJ_ZSMbfZf6nJ9MPWUppNJBBD-5Gj
X-Proofpoint-GUID: PhuqJ_ZSMbfZf6nJ9MPWUppNJBBD-5Gj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=846 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200069



On 11/20/2024 1:10 PM, Krzysztof Kozlowski wrote:
> On 20/11/2024 06:52, Manikanta Mylavarapu wrote:
>> Add the watchdog node for IPQ5424 SoC.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index 5e219f900412..4ca1ef1c4dc7 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -233,6 +233,13 @@ intc: interrupt-controller@f200000 {
>>  			msi-controller;
>>  		};
>>  
>> +		watchdog: watchdog@f410000 {
> You do not use the label. Can be dropped.
> 

Okay, sure. I will drop label.

Thanks & Regards,
Manikanta.

