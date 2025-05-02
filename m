Return-Path: <linux-watchdog+bounces-3425-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91EAA7C11
	for <lists+linux-watchdog@lfdr.de>; Sat,  3 May 2025 00:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CAAA1C0500A
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 22:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3492153ED;
	Fri,  2 May 2025 22:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Cfj/vB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4160A214236
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 22:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746224016; cv=none; b=XopuTWzmWWFaXM03uGkk8mgrjOOdELERV7k7iVoxsThYXuexaCGJiuv4DnwWYhOEOaFMBNI1d8AFjjSZrMOsvQrpryf4S7k1Py/cmS5vFQnGEwEbsd0Eb8N7k5c1qjTNc+rl41aOoSR3BgrjssA94pDDQ/CQYJpsKhTx1hAEvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746224016; c=relaxed/simple;
	bh=B/4oel2Jayif05luXBjTQ2gQHyrpYR6gHiiXrNHCI0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2sXc2jDZQ2QQyezogVsDlcN63l9AAQ/N6oXMgb5vYdghzM30XNj8XVy8Q+LaH/mQC15pOkq7Fu0ewMBuMe5OziAq6WZmWQTPm5LswdyzI60ibw2v7OeS2PGXNp7yfhCs90Arzc1Px/W2aZAOm7ni+SIw7IngJdNpfadjbgt2Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9Cfj/vB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAwIG014267
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 22:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3u+LFEbRiQNy3BBQYrtvebcgwT3QRI0neYbS9BxwHRo=; b=K9Cfj/vBlOqJXZVx
	TC6CuRfwOD+V/eK97Tn0wzE/vIL0n+KunPhYfkK+mOr0itWC6ZonZSyQ+W8XvKkc
	uIZzReHJuzUFWcuJFhOVWDBxsv5VgSR1ABCA6yQyBkL4mXcWcbyhm+qqrQ2eKk56
	Z9kFT5DKE8PQPOnTX5sN2cYjK+LnnqqU52LenT+Y18DTsvuMQM/qBaPuy2k4po25
	BzRW5obstt6drVgrtB93iDFSDINrNV6ELoQyMY5SCJg50nq2Tk2i+UmWEjFYfQqw
	gmzA+/ftvmf3W66dxwy2dWwp7+6aeaG9QCwr0fbYWEthI9sAxVuB5yG7M4pkFUa6
	1rEccQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u41emm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 22:13:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476786e50d9so7100071cf.1
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 15:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746224013; x=1746828813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3u+LFEbRiQNy3BBQYrtvebcgwT3QRI0neYbS9BxwHRo=;
        b=U3v+r+GE1uV9eY8AuYUhr39JzgnI7XnVxx8NOQ50i79Dc73ujT3AaMHd4H+KA8Adz2
         FAsQJ2apjIPT5/CDoZCKRihecktPl3dXXq4YNTv3EYf23YJvMGIxxletbQEkOt3CcQkW
         fBA6tAF3boJfraftzMszGofyG4NJtWeRzWZTVFR5YIV+AG2l/VkBRqf7QQcOwJJAG/vG
         hf4rhMEWXfOnqTwUmRwCZ4kXnSjNZa6Var3USpFaB++4OB8ac7GHTGWqPr3f2WBP9khT
         t7z8lU6NIhAO1VMoYhl/QwgOB1bhz5DImvmQiZ1U1Gy18xfth5zBDtVBsZTiVu3TA+0h
         ccxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTDpItwMwy8BmuOY2CjhAK8Y+04l7DMmfwWR/0pCNO4hQHla5ZGigApQCwBEMZl0V35MmkLNo828RdocnQ/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+u9f2uH6UVaO33jtLGUgStVnZm7HKsraJnMvUYekiLihLjX9P
	V9r5tHX27De6b7LD9LI1e31sxckvmc90Cuz8AKj1eaCfn2sWeNsGznaaPFr7T4I6hXfJsXxdZ3X
	tWt0wolEOjsUv/p9SvqscHux2jnVjvnkB+Y+QX57hDMnl47rN11i3vTKUZV3qh3YM9g==
X-Gm-Gg: ASbGncsaWLOarwzlcrKuDJOyNrCF70cL5bPNDZNtcnUylHGAJj0Nfvv7K8MWvPlwPeR
	yfAbA547w5fjxWypETBAsqWhmdBygtAWmkxsLmeBBYNDxuQBwVM7e06c5UBekh7Toi3JygSiGhH
	wqA6lAJO15DUQHy0YOQQGqnSPDsClJagZay5Z3ScoLez25jZWA/BR8afsJ5FojBjIM7dZuA+2dj
	lbIkLJUsbxLXHePNoSLAt+nSJ4+qyNZnbrWci71cs/OC4Ci/3DvDvZ9byIk71Hhyzq8O58INSDQ
	BC+oPSc4DrUDcIXswbwn6yWYPOxlVqojya6y2nbkZWJFSfQUcDKw4DwfiWAgF8ZxD3c=
X-Received: by 2002:ac8:5d14:0:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-48c31b1878dmr26360321cf.7.1746224013214;
        Fri, 02 May 2025 15:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIB+E/EBRSm2CckOBaiga8MoS0NtnV1KFVCJ4k4ISPBAkdwIYAzWP5vXAN6u6EtdsUp5XAjQ==
X-Received: by 2002:ac8:5d14:0:b0:48a:4c52:bd5e with SMTP id d75a77b69052e-48c31b1878dmr26360061cf.7.1746224012721;
        Fri, 02 May 2025 15:13:32 -0700 (PDT)
Received: from [192.168.65.170] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm104865366b.138.2025.05.02.15.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 15:13:32 -0700 (PDT)
Message-ID: <3333cfa8-381e-4c10-898b-a3c4cf8159e5@oss.qualcomm.com>
Date: Sat, 3 May 2025 00:13:29 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
 <83c427de-c678-4408-9b04-2f3d2eef9fac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <83c427de-c678-4408-9b04-2f3d2eef9fac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6815438e cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=i7H99Igfn1kKsJUMNAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3U20Z_Ib2dsMbIZawPcTbEtKbrRPFIOL
X-Proofpoint-ORIG-GUID: 3U20Z_Ib2dsMbIZawPcTbEtKbrRPFIOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4MSBTYWx0ZWRfX38S+OAUJNirq EETGYORczGExgxJDmmsD6Jm79FEPQzzINyuzeLjKW6l1IA0wjRiv37YDTolhCcanjcePnNK3oh4 AOm/tmAuTFoaNVgolG8kpdLvIvy6MrNxyuoNd7+LfWQAAPO7jUXkNvHltG8c2fkH7onK+a8Da4Q
 no4yPTHnRkG/od0+PI2IfjUNpHB/9y33Txmfu6AadtWOuksgQIjTMI00/ODzLu5f29gqyQ/O9JA Btff/PeX3sRo2SWor37IyK748hmYVaU78Bfb3pK0+mXYaGUSfxanSLfcJ1M3fjgseVUKoGv63YG NWN4mmGZT1TtVfN8EF+Gzghxpb4J+syLAGqEcJguBuo5t83Tuk8JM7Myrgw4TON45p6WYNKbjwz
 9r5sO1Y4kMrCLlyBdhlVdlnrxa2eE8pGif09rpEW+z6uB4pmmk76Qtb2uBHmA2XQZ9Iw6RbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=761 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020181

On 5/2/25 6:08 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/2/2025 7:03 PM, Guenter Roeck wrote:
>>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>>   {
>>>       struct device *dev = &pdev->dev;
>>> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>>       wdt->wdd.parent = dev;
>>>       wdt->layout = data->offset;
>>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>>> +    ret = qcom_wdt_get_restart_reason(wdt, data);
>>> +    if (ret == -ENODEV) {
>>> +        if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>>> +            wdt->wdd.bootstatus = WDIOF_CARDRESET;
>>> +    } else if (ret) {
>>> +        return ret;
>>> +    }
>>
>> Seems odd to me that there is now a function qcom_wdt_get_restart_reason()
>> but it doesn't handle all means to get the restart reason. Maybe I missed it,
>> but what is the reason for that ? Why not move reading WDT_STS into
>> qcom_wdt_get_restart_reason() as well ?
> 
> 
> No specific reason as such. I was little hesitant use "goto" statements and such as. So I thought this would be little cleaner approach. Please let me know if I have consolidate everything under qcom_wdt_get_restart_reason().

You can try grabbing the syscon handle, and if absent, fall back to the
common handling

Konrad

