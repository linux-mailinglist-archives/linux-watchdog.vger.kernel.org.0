Return-Path: <linux-watchdog+bounces-3423-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D852AA7748
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 18:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23BB77A72B0
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 16:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A2825D54B;
	Fri,  2 May 2025 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSjuoatr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B4519D081
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203346; cv=none; b=u6ljm17SlJreqIIE4gCA7vYAECp7TgUjA6TJSqURGDuZ8+ZMpESmzj+jN5+JrZlna9xz4nVw3JethZNy1HLoTTeaQIEardAsfp+iwHBjLDhrk/vLehZzNAVVaWe5Fe/V9w9AoY9qP/244cu4ahOebKCkqPHeB1uD7tL/8fyPqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203346; c=relaxed/simple;
	bh=WYH9SiI/9OQc48EIzrGzJHbOYo13HPK+Z4Mom0Xb/vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnuJ0RUwaaJMpFzVek0JQbM74epWdjghw7Nd8qDfRGI+tQRITRTQr9YPXfCQdK/BD3v8BAM/xtntcp8xsZbLVewr4pgTEzby5feuInWwdp+3/+dOd/xuQJdJV99QiN4Vtrw09FXr2+LAGVTVTkfjTKe7ceSOxYTpC83UYariM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSjuoatr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DnmVa017794
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 16:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Imz1o0ryfSKDi3h4M0Ledl/IY2b0AdaI+0+ZKgPWnr4=; b=bSjuoatrtiJvtPT6
	3Y08+ukmJt2o5+tYZfIZL9UeMc0MsUD2S1smW/eLeruRjtcb9Hqp7+TOLU5qIJYc
	G1R15j45rxv/61jnJyEmRGJ2DpX0gtmzSWcZSXU8DWMeyI5mVG34PDtKliL0Qdd7
	X3d4pJs0ZnQ7NU7Q+jXx9IfOq/erg4CuYl4QtlILNTZqpYGJDZ/KvIP3AP9WUKfQ
	h+LFVMGPwSZ3+LxSKctxB5hjy+c8wDI0iD0CksxE19E0/scGrG5wULa0DWG6Lnd9
	AwJQdXt6thnLIAa1N0NtlZCGtCzwSUzADNcheVzvbAj/tWCC+sHU+gFMygjSmsQE
	Zx87dg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uagreb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 16:29:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739525d4d7bso1642151b3a.2
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 09:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203343; x=1746808143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Imz1o0ryfSKDi3h4M0Ledl/IY2b0AdaI+0+ZKgPWnr4=;
        b=RGce8bfk8r/fd/Kuv5yFwNCk589E+eZBZJH2ycJuLWREqmDOVfqRDWn9JVgOs2BUFp
         i+ZwNgR7z3sV+YqUFKvHVUMGwPb5tHyxhYMg7UCX9xJrubdix7U24Gk7heRGB/w5qmf5
         dJDn9sfpN+UIWrMJqeLBQVAuH+RjFS0K/SMMmW1uFPdkGdgpHfp3lRSEybs/RTYDb6O5
         /kpAk+sWkLRkFw7pffXtqyvfiHM5Ng67TzCKCbDfrOIC25hZLp9nfPR5+KMaXayKxN6h
         sXk++ll+RiBRMo8nrnJDGUbgwyhYWDHMeO3HmZkbSlPzIhgc+A6hlx6KS8i/sqJImSoj
         +MJg==
X-Forwarded-Encrypted: i=1; AJvYcCXqMMo4kxwRcBww/T17aPZnpUPqHKiVBQFjogM1UH2jrSClhMAy8LPSrzqGrnnLHE8/TeBCrd2Q8TNlva3KvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDw1Sqb9pDWjH9PFl+ZQmX1X3vAucHvq97DRrfapeVjAOpBmx
	eM2WZZe321rUGdqgC5OXY4qV7RogM8UAajMQESw424oyPDbzjrAuaudO7sv4EGA0jVRb3Iyq5nk
	cbW4iYaS8R5uy6LUfS7eDtpV8HKB1jSAhuUbu9zXHVhgk17lQ8hbOqHbzCijG91CLog==
X-Gm-Gg: ASbGncsjrVZfRJSZx8CnYOvVDemY25jbGhIXF6QAT6PuvME3ei5pbVfC/+ZD45rEUDY
	isOd/aNCWWiobj0Qc3EMGWW3bo09MecAwIfAk8nA1jMbTBeTL1z3fCLDhdVAA7SxRc9XBCn/sXP
	4pAnmB0LuxT7YpbjdWnC9MCR4j7SDAoZbfkDDwvQ4795YeOWD+aya9o7oNJPSYRwTiSsPGDWcqL
	MkUexyhmrjSGq22vW2IyA0+QlY4ANcmx15a7NBMVexqkoCv4+c1/sNKnQ8wPCNAg/pbweRELggl
	sBT4M4u/esdL4ZQgS9tn+hNqNZf2eyj4QDOa1IqNkWEtaXkEFHe/
X-Received: by 2002:a05:6a21:920a:b0:1f5:7c6f:6c8b with SMTP id adf61e73a8af0-20cdea52d9bmr4592372637.10.1746203343280;
        Fri, 02 May 2025 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/l3hJUPTNLXKqmeVG2ZXFmeMKkNVJ0yJoue1mM9p2VxEWSQlOwIdlLxb1RykHuv6Sn65E7Q==
X-Received: by 2002:a05:6a21:920a:b0:1f5:7c6f:6c8b with SMTP id adf61e73a8af0-20cdea52d9bmr4592347637.10.1746203342906;
        Fri, 02 May 2025 09:29:02 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbcdd0sm1844438b3a.67.2025.05.02.09.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:29:02 -0700 (PDT)
Message-ID: <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6814f2d0 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=q-cXM-vEBeggpBd9xGIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzMSBTYWx0ZWRfX29/jm8Ye/mGK SDpCO//KwvZcqGQPCbxs17aDglHHHxsBitxhqhd7Mqyq1CDjCYiunSvBhSOhbAjgQVVy0VLzfEY ksFEhQgdmNVx1odbutZc9Ct2eccd5PdyMWRdnj8P4FhsMl9+BE1owdX3b7XdeI60PiizwVjetw8
 8Tas46/N6ZPxwaHbzcBbL6WO/Y6LXre/PrxuulCczYPoGA3uX9epn7agV2j3Q47cV+yyqRT214X CWxyOmAvgJ+rixkIdySX0qvAnI3RFd+QPs3G9pfmmazbJYdwhvLGDPAbdSFWRlZ+hJkFEEUGchC TDNsT0kiZDlXHICucOIeBkdo1KOOjR/LjU62KheTqwC36ZTzjwh3uf0uT4+MmA1+vs9tZd6gKDR
 ZWKdLLnbohzPq6A+ih5haNcwcEvK2DQxsQv/XNzDFD2X7bUCi/pNmHeGWIOSV9UMwG0imKb4
X-Proofpoint-GUID: 1572l3sfQMHeANCek5Ob3BhwkAjT_k4W
X-Proofpoint-ORIG-GUID: 1572l3sfQMHeANCek5Ob3BhwkAjT_k4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020131


On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>
> That way all platform specifics will live in the DT, requiring no
> hardcode-y driver changes on similar platforms


Thanks. I thought about this API but it didn't strike that I can use the 
args to fetch and match the value.

I need a suggestion here. There is a plan to extend this feature to 
other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT 
cause as well. For IPQ5424, all 3 cause will support and for other IPQ 
platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any 
case, can I define the DT entry like below

         imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under 
value> <Overheat value>>;

and store these in values args[1], args[2] and args[3] respectively and 
use it for manipulation? If any of the platform doesn't support all 3, I 
can update the bindings and define the number of args as required.

Is this approach fine. Please let me know your comments.


>
> Konrad

