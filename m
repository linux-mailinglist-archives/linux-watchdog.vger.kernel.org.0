Return-Path: <linux-watchdog+bounces-3288-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE9A85783
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 11:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2ACF1BC2D30
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 09:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412AB293B61;
	Fri, 11 Apr 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5rm8Cbk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8412989AA
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362203; cv=none; b=RjlmWzgP8UPWp474m7ZZbehFF5jiOmnIv0eXrAqUU1ab38pdy9l6O+DHeOP3SSECtym79JgU6tnk3KQdkLmYCPU7BEHFVixWk8NaqlLDI8Wd/He+7bs2OPgFVFvMZleS1Jr8okwx5y/J92e+fbGiLmzAEBREoNJgo1SO/s8JPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362203; c=relaxed/simple;
	bh=sFOal5fvJMlyLi0IEMtK4WKzHKB8KXpN4zKHhEMZS00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yw247okzCNE0Tk+bRlDEkaOGCKJn+2RoDblFFkL8PuY0sQ7AL9IihjDIEpKZhtXeteRAUOXD5/AZNYz1/xSMx3nx1JMT5v8lFZssB8fDFXEOQiiS7LMvYpLuvn90z3u2WhyvBrVifLcN3yseRdv7oflf1RW6gLrKfZf8FO+Lo5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5rm8Cbk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B59CLX019694
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 09:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcX28u/B6nnDhP3GF5NZsiUxxPBeyTSK7kv3Ksht/ZU=; b=h5rm8CbkOkn8bNQb
	TSeGaqF1896q9BJVrNXFghDYT3VSxZSFb9sAlujk3zrrBVTq+O+DtGCh+feVw6LN
	rPcGdVHL8SqxF6BJCOux6cTwwywEDj+z93zIzN3mlALJvUJfjq6yX/zOST20veik
	g5/Gm2vXd+sBCsgC2mEBCASaD0mc+FKmnXZ1Hfb1/tU9ezah5KcPMr7TWz4jv9UY
	JZQFrNeeoYYUVkUzV0mPmaQrrNLc3pjw8uHBD81lfPC/gPNKoKM611YzhkGsFvXG
	fzDMwjKSYondWVF8EMEX2oWEHZETBAc+U+8owXkx1psXZshoPaC105Zk/8Yr1WJc
	efdO7A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrt0c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 09:03:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3c21043so4050626d6.1
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 02:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362199; x=1744966999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcX28u/B6nnDhP3GF5NZsiUxxPBeyTSK7kv3Ksht/ZU=;
        b=rzbVSo52XRsbMaZc9L71WfBQYMI0lh28J0fuv10g4XJlJlySttnCaigDT7zRYltnfz
         4q7SnmNkqCa6/Av3a4fHrbGUMhi+VWDJ7cNmepqJ6o1gMAXbHFW06rYMMWrpF6L4tDVH
         3Pd6IRQ2sjoD6swzHiOBvKPc0tpgCRJ6CfL9kmxS6HsN6kN05j7fk11BhYvaA1HRtS1Y
         BZGxKjKtu6XIOWleHkZO7KWN1dVdlJdwovTgSmCR7Kz7nPKGaH251dHZENb9V13DEvzP
         CtXRn8Re5GOii0LkXwVMicMZ4nAiA7m8lj32gh/pjb8tMDZ9JkYiBqx4lEQfKSjM4pHE
         GeFA==
X-Forwarded-Encrypted: i=1; AJvYcCXrm4JepdAWgqmlTf63etNIwwyi0r5TR85XjW0tSo46+Dm3qUEIwOcdzuklWuYena3ZXvkoFFMJ6HfbszTOig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIS4k4WB1BGHL0W78t/AYM/3BgIu9NsiIIwUaq/1hyUPExwBHx
	InnR5GG5joC9ruaq15XqWZ/UAkWwMQCUMwAB6Olm8MfHn+Ov+1tfDZNkFCNLJKQzPHjEuRFjSjI
	A9Z0E0L10MUCpfIF1TCyiwRK+/BESP70ZgZrZwPXGww9adt9d6ilkc6nyN+ndhXnb+w==
X-Gm-Gg: ASbGncsrIDGPUk26PzT0Ma1S1UdOALgHah6fEhfmJOz43qWK1ukcw3xYZUdc95rUn10
	QEtq9wG+lI8XOWcR2aH543Ej/QtfPOr+n4kIdHMGKOsoP2j58MV55F5LsULjzUpPCW7EVsQioHR
	Ihm49ywQoGC0zX+BjpJ7BU1iNtdyOoSTzsFLDUJgfko2Yx88VixwaEwhAVLFk8fDaWjYoL5f1c0
	2Tt4knotrV4fq4sEvojKkdOFh/hQubrpb5q92n+L3z4JsCDo0kZs73bnKTDh8sUYW38ga9jOWSb
	6wguEA8DtiRqY+JTCLHhl7XslNF43+rG+1Zpe5y455EBYKk57ClaJ7+ixVPAXjdf3w==
X-Received: by 2002:ad4:5dcd:0:b0:6e6:60f6:56dd with SMTP id 6a1803df08f44-6f230db0f83mr10469696d6.7.1744362199277;
        Fri, 11 Apr 2025 02:03:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ9eS1eKJ2XP3nLyqLoQyINrDYzh4NDEuQy5WWCu8eTaTiO1V15qXM1ewf/XWF5/8QYX70Xw==
X-Received: by 2002:ad4:5dcd:0:b0:6e6:60f6:56dd with SMTP id 6a1803df08f44-6f230db0f83mr10469566d6.7.1744362198954;
        Fri, 11 Apr 2025 02:03:18 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd223sm415452066b.133.2025.04.11.02.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:03:18 -0700 (PDT)
Message-ID: <0b71ee9a-f222-4254-bc12-4c98854f44c3@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:03:15 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
 <6298f149-caae-49d0-af68-c3d102d0ef7d@oss.qualcomm.com>
 <54efe237-01ea-4f98-8dbe-390d344aa6cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <54efe237-01ea-4f98-8dbe-390d344aa6cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qcWzWs93avjSff0cCDj62MxNPQYeUa-K
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8dad8 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=zfULRjUYX0gFTwn-MscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: qcWzWs93avjSff0cCDj62MxNPQYeUa-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=890 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110055

On 4/11/25 7:01 AM, Kathiravan Thirumoorthy wrote:
> 
> On 4/10/2025 12:11 AM, Konrad Dybcio wrote:
>> On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
>>> Add the IMEM node to the device tree to extract debugging information
>>> like system restart reason, which is populated via IMEM. Define the
>>> IMEM region to enable this functionality. Corresponding DTS and driver
>>> changes will be added incrementally.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> @@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
>>>               status = "disabled";
>>>           };
>>>   +        sram@8600000 {
>>> +            compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
>>> +            reg = <0 0x08600000 0 0x1000>;
>>> +            ranges = <0 0 0x08600000 0x1000>;
>> It looks like this should be a little longer
> 
> 
> Yes. It is 112KB. But only first 4KB is accessible by all masters in the system, remaining regions are access protected by TZ. I shall mention this in the commit message in the next version.

I think we should describe the full length of it - it's only if we
add a subnode that we actually access it

Konrad

