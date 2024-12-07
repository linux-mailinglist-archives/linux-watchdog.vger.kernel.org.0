Return-Path: <linux-watchdog+bounces-2509-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D49E7FDF
	for <lists+linux-watchdog@lfdr.de>; Sat,  7 Dec 2024 13:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B979218845AD
	for <lists+linux-watchdog@lfdr.de>; Sat,  7 Dec 2024 12:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C9014658B;
	Sat,  7 Dec 2024 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekSiNk2O"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D8E13B293
	for <linux-watchdog@vger.kernel.org>; Sat,  7 Dec 2024 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733574762; cv=none; b=mrK5zRw+bkiB66EI+ONXOm7vvaiWefuHDW6JUXMeLb9QfXGtZKIWvkEDKSNyaYWOBAVFBkjqZFd0GMlicuMbkSQuUlr+FEza/8fpTBIpmg1UQb03Arcun1/vKrxS7N7RgPWauu4XzfCE3Qpnu1tdh8w186B0Rdv9FYC+IeZz7aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733574762; c=relaxed/simple;
	bh=azUX6QjhKkZXkY6xijKfOhHqxkK6wJmGsZLPCnqm44c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrBSU/VE0FqT4+RA+138douzV2hqWbH7yxKqDVyCi/qiA2y+8TGrlarkr7ojX7a0/bOh1UVnrKTbqOBMDrT8p5Na3j0LZDLc67ZbX1KtBszIgBW8uViwzlDBGv7UFHAdMBMicUbiEa1ifMDEqeEeaxm5kfGJAbBQXRuajor3PhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekSiNk2O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7BuSsx029230
	for <linux-watchdog@vger.kernel.org>; Sat, 7 Dec 2024 12:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M92CAdkic6Iwv4reDSMoGjp/K6oYfQp/wrqMiHWSzvI=; b=ekSiNk2Ox6mo4Y81
	3mzkonUlxfEJAYcBwP0h9jYedTY0ks7CLKOEhnK97G6vEEFOS9kvnyc7NndAdwRN
	neTR34x8dM4CXeZpCkiM8YhgXDxUKGW2ZO+S+8i2oPJwZgXWSK8SL3qTR2JePIWC
	hiMRGZ9BlO8FSDc/UdivcLvaIxD0wqwkU059Yyb2OFALVJFZaIa+GiZ+DnGBq9nh
	kcvMQf6fQSZdl3+nEZxyGMPniKVhJkJVjlyXZv+yssKLaqcA+E6tP1R2LtyymY7m
	S0xNw6eI2QP/zWeE7RaP0t3bf/5j4vjDzoGJCETb6AyDibZokVPDLOzwFMTqIi+z
	YVglTw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cbqn0v2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 07 Dec 2024 12:32:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e7016630so4213106d6.1
        for <linux-watchdog@vger.kernel.org>; Sat, 07 Dec 2024 04:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574758; x=1734179558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M92CAdkic6Iwv4reDSMoGjp/K6oYfQp/wrqMiHWSzvI=;
        b=IY0gsbNvLzYX8W6VW8EDtfnYe3QhePc0nuXkhsrzwFwdnUpvcVJ7rlceMHTVKQ4RUL
         UY7wxbX6Shv9e/y1Shqv5HWh7Fg2vzMv6ZW6OLNd/ddsnRHHPKcslapTvt95E86T7Ytg
         NsJyOVHzcxpsHq8zaThJWbgpiBU0zOKv4TEzaSO1I1MxPI4uw56tyZZ4SQGnvxxlLrN7
         8fdD5TepyfJRqRSQ6lJx0DLYjB+q/28v3BSvXb4KhVA5e/qyS6BDG27dSgrkLdfSh5fU
         1fEyeS0VgblMwCGZnSSN3jOgWtlgLgVKRyrIgScsqkgZfYsCqmJ7YWRwtU/DmGVOkv3h
         LXlw==
X-Forwarded-Encrypted: i=1; AJvYcCWXNNtdjA+oFwhBR1JU3F0U4uyOV39gQVgHkIsDkzyJkylEeBCZbzm8ySyeXDgEMSvvJnS3QnrmYtVwcVRoOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWMyxPivFcd1qXB4ONYaJgxHww7vQzA6wkukN792bDjER59Ui
	02GNthowHMYXvtyJg2j+IxmKGXM+6d27eFhTZxlPKEUso+7Xwzx6efxSxPLb2YKjza/8T5ey9Kq
	RWHaghA8qCvwNWQBbkhVrx42WoATiZgVMWIfPAcB5t4tWuYoc9n6fogPt0KYIDq26FQ==
X-Gm-Gg: ASbGncujTDvhXMz9i3ilpegR2l1/yzruyn1+ZyHl4Y0bQ5R4cZvPhUEqEBbhPcLzLSO
	hc8qvqkr4ftreLPla124MMCNYnfaup15X+UKwHE93EV148zGlsbNOC8GEKEd3chBFy1ubetDQFh
	7uByon31vSHtjaSkUy+k+UUCIZix2ZvMlSiZj6tvU5ZBH53VXnuiqP+AB9QUBdQeFvIkOsz8AIw
	OyEaViFxG+IplXHYyUQFmcRc3dEQ883pjkEfujD7EJ6wmunx/y8yTiL/X6epa5+ePxPAtKmYTLA
	/0ISEsDuLn/uYF+FdH4nBVtcG4XnCEGcgys=
X-Received: by 2002:a05:622a:1106:b0:458:21b2:4905 with SMTP id d75a77b69052e-46734e23e91mr47843301cf.15.1733574758461;
        Sat, 07 Dec 2024 04:32:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3wWXdprg/kZHC+CBFAeMYZnaaMhc8iBKhfLMgGFCoCHZ6CdKvwoIOqu1ehiQUHy2+VrE+Xg==
X-Received: by 2002:a05:622a:1106:b0:458:21b2:4905 with SMTP id d75a77b69052e-46734e23e91mr47843151cf.15.1733574758072;
        Sat, 07 Dec 2024 04:32:38 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62602cf52sm374919366b.115.2024.12.07.04.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 04:32:37 -0800 (PST)
Message-ID: <05e15b8e-d7b5-4af0-a811-4222bce0f99f@oss.qualcomm.com>
Date: Sat, 7 Dec 2024 13:32:35 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Add watchdog node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
 <20241120055248.657813-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241120055248.657813-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oPo6BlRg4fA8DSVk3IID2YKmn1LFvhcI
X-Proofpoint-GUID: oPo6BlRg4fA8DSVk3IID2YKmn1LFvhcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011 mlxlogscore=861
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070105

On 20.11.2024 6:52 AM, Manikanta Mylavarapu wrote:
> Add the watchdog node for IPQ5424 SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


