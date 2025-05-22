Return-Path: <linux-watchdog+bounces-3573-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473EAC1031
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 17:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71FF1686DC
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 15:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBFA28B408;
	Thu, 22 May 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKg64CKf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB82F41
	for <linux-watchdog@vger.kernel.org>; Thu, 22 May 2025 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928719; cv=none; b=M3749Bj3baa0Iw5RcFVNdLMvCPu0gW8o5qxPW92LxTyQs+GHbqdAFtd2nEXXwuXbN5ofVjwS2xqY/yvjXf02BNG14YjlHXCJtdHeXpSpRTxIa3zk1pZH69iZ0YVgvyD4dsH00wxeilN0S/P9FZIEI0MNPLtgrMZGyQxHc1YLl4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928719; c=relaxed/simple;
	bh=2oo5AEuln8MnpRMZv0SN3H54uiodXBOSQCn4VTiIjJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJ2fBlvuu/HmAY/nULf1xYVNkSrdYuIqHI4k5geTlOIPm8ikEucsZxTD98ZkWI1sboLpyYFNGdDHN/hey/M6RJmElmussG3h+hf2UrYlAs94hJnCYxRxEpKZlBbnD8f6FvFXilSOyN6FBzKlmz4k/WkFZ1QIWAftTAyLyC+JVPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKg64CKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7ALna000730
	for <linux-watchdog@vger.kernel.org>; Thu, 22 May 2025 15:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxqXkbYZFLp5W72JIXRZoPEyHZQry5w4rYue7BdQmmA=; b=BKg64CKfTd1PHlJX
	BLs02zPUVePYRf8As9ciuR0j4DPlNxF5hlolx/Y7COfBsHTW7I9ky5q8If2ZBh69
	9xELkVp9iFAzzfxCcVEh5r99L2INffSAikBbUnfCAFLUeqRrMgMx4fKZGmp+G1iV
	tBxwHLccHwa91MIGGyc9pLe6NbGhr+fY6LRPm1idcLbYzGn/766un+H7fjXofFpE
	sM4GNMOSkVCpFd7UzvVFZN1TJCfQ34u1oAkrv5DXN4eJbEePZErq8Rl63H6hWvvL
	nW4VRuL/IeG5etrvIOaoQB7NzOv4yjrRCo8cmg7bx0t9rqNmCdNbYrA9P/uNP2QN
	odSx+g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tn7hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 22 May 2025 15:45:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f0c76e490cso20543006d6.1
        for <linux-watchdog@vger.kernel.org>; Thu, 22 May 2025 08:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747928716; x=1748533516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxqXkbYZFLp5W72JIXRZoPEyHZQry5w4rYue7BdQmmA=;
        b=kFCKgnS+vEfp8gteGv05yvb6jGF4RqpjUpe3c8PTRA1+qufckC19C9QUL3SMI4LLmE
         sEa+EZTfm32BYyUfaISOECvexfvi+PyUvsXmAk+n8kTEb8EtStFpDwwzquKQEf8fkcwk
         mslYRxql2/ngbNyC9eDH0GwLuPk0IvMVkcJVtFqFmdGXkSNCLyCro7coRKthed3eBWGZ
         PtPK4mIWUvAQnqnjxJmdmc6N082vYFIaSoObLnVSsYBQsslTHY8JUUxQ7ipQbhn6tKHA
         jLoxNkjekfFxrDwJSKI4jFfItpSEg0p3BBrQnxdkokCx6iGBzKYWJqjC1pgxXrsbRhnJ
         F7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVEZGV2Fb/CaT6D7wPe24WE/82bEwV/y7PI3cTfuTiTmDufEZe8F5g82uU+cpzTQPT4ORZ7wHcAGHOLPTGFWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX7m9CXA6ftN00hKtdyZnA7O5yQvr2t+42fepzizTsRY+rJudL
	9qufZDXAXp2YIWO+tn7uvZ6x/k8tDpX11eodGD3JrpJ+HeCNJrPtJVvshZXiL4ZecoTEHmYp1ya
	cXlvEOI0k96asXJbcU6pAvOoDFnPaEB1D2a7/1y4QIWJmyVOyRDcyUVWbU6qGVxrU0aD+xw==
X-Gm-Gg: ASbGncu+w01dx2WikE67bzECptYeq9sLjo798LU32uOtNthdzB3DOiSpvvyaLNMngtH
	WuZUg3c+0lol48L8/4m/XoAgNUBjOOKnK38XTS64wVexsYVNXgS5bV12eymzrckyVhaq0iCwDUR
	BNXZiR/PACAdH0MSMSrmGegXDUX5rMzy0gdkTGnE4msMkj90rb+5uJFke1yCM8BnCrqN0pXubvh
	W2wBzYztiPKFEOJvawiADqvBB29qpcVe+dVlG+ESLPIoD3CsczurgqVciBPtinKKp1Ov+rti9oS
	prIjrhupL0djHA9ger948D0Dh9t6N5cdG0AseEOlIQyt/hUwZqDSAHvHzwnRcqoBLA==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr130228556d6.8.1747928716288;
        Thu, 22 May 2025 08:45:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQNmrcRDS0TOey9X0Jcpi53g1AQj/TZ0iGbNkYLDXuyFaDcRqj+aik6BrMWX0FUjzxKOJjlw==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr130228236d6.8.1747928715833;
        Thu, 22 May 2025 08:45:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4e8afdsm1101228966b.176.2025.05.22.08.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:45:15 -0700 (PDT)
Message-ID: <85e30c0c-ea77-47da-9fd9-4293c7a78c75@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:45:12 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
 <20250520-portable-anteater-of-respect-c7be5c@kuoka>
 <37bd619d-242e-4488-8d45-c2c85612bee9@oss.qualcomm.com>
 <b8003fdf-66a1-47e1-8c78-069f0739ea37@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b8003fdf-66a1-47e1-8c78-069f0739ea37@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f468d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=3MHuiekdCO7yvOlYeq8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 45Iv3KDdDI9BTQDaeMBw4aC-0PsjGUiy
X-Proofpoint-GUID: 45Iv3KDdDI9BTQDaeMBw4aC-0PsjGUiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MCBTYWx0ZWRfXzy8PcIRo4yyw
 x9DJKM07eG+ujYSV8lHyZzCYgFtZ/q1NzCGZVXSVjmQZ5BQ+0rLgEOq7sROApTXLUin7YtszS/r
 tD6XGM3Ih2a+zHbm/csqWVp134FdCNvcJpb10fdDVvpBhkFID/7tigsnrMjYeh9iWvlcSMWTCG2
 nQ7fCN/5r+QIEcLnQd/IiXAU6MY4oo9qDU56oJqMc6hcHNyHRynKSVZbUbTpDQyGYOoqxegnH4V
 wnj3z327PnsDSkA2XBNv19Du9QZiH0BVAKiI3ZkztOrCWeTmAjYwCTbLVWigO15XZgE4sWrIUIP
 yaWNxU7eWljzPwOYv4nnQdDR1uHbbRibbwKUBLT+yvfDsO8oeG/325Tyv9aGL4k5gJL+3mSs7qV
 8QnghE1axlk/i5Tqpe8vUw+EtDVswoThu8F16JUxhgAEtF39DpVIwZTMcF9SfwfKTmvxWp+U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220160

On 5/21/25 8:53 AM, Krzysztof Kozlowski wrote:
> On 20/05/2025 18:00, Konrad Dybcio wrote:
>> On 5/20/25 9:25 AM, Krzysztof Kozlowski wrote:
>>> On Mon, May 19, 2025 at 02:04:03PM GMT, Kathiravan Thirumoorthy wrote:
>>>> Document the "qcom,imem" property for the watchdog device on Qualcomm
>>>> IPQ platforms. Use this property to extract the restart reason from
>>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>>> entry with this information, when the system reboots due to a watchdog
>>>> timeout.
>>>>
>>>> Describe this property for the IPQ5424 watchdog device and extend support
>>>> to other targets subsequently.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>> Changes in v4:
>>>> 	- New patch
>>>> ---
>>>>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
>>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> @@ -81,6 +81,16 @@ properties:
>>>>      minItems: 1
>>>>      maxItems: 5
>>>>  
>>>> +  qcom,imem:
>>>
>>> Shoouldn't this be existing 'sram' property? If IMEM is something
>>> similar to OCMEM, then we already use sram for that.
>>
>> We specifically want a handle to a predefined byte in IMEM, something akin
>> to qcom,4ln-config-sel in
>>
>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> 
> Nothing stops that with sram. Above example is poor, because it mentions
> syscon. There is no hardware as syscon. Does not exist. What is IMEM
> here, what is this relationship?

IMEM is indeed a small block of on-die SRAM. In this context, another subsystem
may write a magic value at a known offset that would correspond to the platform
having been rebooted by the watchdog. Now why the wdt register is cleared in the
first place, I have no clue.

Konrad

