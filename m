Return-Path: <linux-watchdog+bounces-4502-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5BC2ADE5
	for <lists+linux-watchdog@lfdr.de>; Mon, 03 Nov 2025 10:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD4AB3A2B3D
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Nov 2025 09:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464872F9DB1;
	Mon,  3 Nov 2025 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqvSiMFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqT89aiv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B02EF67F
	for <linux-watchdog@vger.kernel.org>; Mon,  3 Nov 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163617; cv=none; b=MEgmCCyo1PU3f5pUjF3kZDdDUftGhbubp0qDyGQSKV5UxY2tGAQ2xxfhZplM9lQQdwqrowkyY3/NKT6WRABUu2ENWGxynp81Kv5F04500djjjhqV4+w3+0qVGbDrr3twAAfovAEy6ggz3+4VvrS3rQZ7mSs7QBKW7O8sHjBjm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163617; c=relaxed/simple;
	bh=QiXdWdOFVk0UNI+iS1e9rGTlkwTDKfuhkBJCR/MtXbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2dPg1EHIdjZxWu55DoS0Ai0Pm80ZmmWazvrhTXuA2p4frEG8XV+Cy48tjuMX71kHSNZ4+HxUeqwzLt4R1EdEb4MMPlQY6sryJMwVgOTB3Qjc8ouiyWlqdvpigc9/VcowAACjg9IOLm5u+lrOShXharcu9BLc+qPShwD6axyIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqvSiMFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqT89aiv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A33Du5N1957887
	for <linux-watchdog@vger.kernel.org>; Mon, 3 Nov 2025 09:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+bc/kwQmC9Ufu0+zVgimIzCzDDf4tsUyHk/1mPjqqQ=; b=gqvSiMFjzPi+MEqR
	cWaC/c5/xKp4Es4wGRrY7ozek7bhv8OVYwJxAazFq3RvouzCRcQBWcO8EgLg6+Vv
	p0U9C6Xg4J+Fvj64nzwV1MAGM2T32iZeKHI9De5VCCQOdbBLEKa5HcRoxkSbQ02m
	S0jp+EXV/KtdMSbe6VQiVuTMkm8TJa1mNHrakP/Z65ip3FdyMWCjoYyYx5pH1+6D
	qUpERfZX+qKSSdU1dHkE//kdqrdVBIbzAeg+cG5MEi8smSghVVAEuI/4AsnBGFYY
	hWvdeyp/8+mEOcGd5nJxZer3UpL2zOajDy2o8GWPD31cczZ2y+JWfu4mpnNlDBIP
	b8HfBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6ma8s21u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 03 Nov 2025 09:53:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295952a4dd6so13161015ad.1
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Nov 2025 01:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762163613; x=1762768413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+bc/kwQmC9Ufu0+zVgimIzCzDDf4tsUyHk/1mPjqqQ=;
        b=WqT89aiv8FveITrhNjE0zC1OxUMzkpkQkJi2Bsn7Socwj52wl+a8tD94Vb8cTaNeYs
         3p4oo8m7ElzworohRB+bEQUv5LcPVUpRD0NcBSsPx+VTNhHZTdtWfQXWzImlb5IbPu7n
         204kXq67JvN3AxPbE6jpz03jMJ9rX+0T4CSmKJMVzkwr2gO10uyUy86mbsu9Khffm/ci
         nCsVZCtfxwA47xp+cFcH3g+6L7+9qwrnZOKrJ3Z3DXx7Q5B5oK4/ZvnYXCxasLo/3FGd
         vkQQ6uRIYx1xxQo0cpDiyF0C2CgPdrVzbgIlfU6ySUqe0hKz0T5mIc0T22Zpvz/k2430
         5CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163613; x=1762768413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+bc/kwQmC9Ufu0+zVgimIzCzDDf4tsUyHk/1mPjqqQ=;
        b=WOUikzMhK57uKZToQs7egYksG/6vgYwTRQU8fgZbMhW1881EWQCBmQT4KuaKLYbtG9
         XdNwjtkIobqH9fEoWvx7gQA2O5R9JNQHkPvpw1w6N40+Y3CMRSjunPQ6/DQGoNjhpuky
         4PGmqp+jnJbgtoQnVI2GKF51o5z1UAylh05QRnrq8sDTh0XHRUrHcYeq+ehAnCbtnvXp
         fIrftkKK9Aw7UvrICzfuVyCU+KRlhbli2Xz1eTDxL9ru4ppKrghMhm6rhf+NwUXS2UpZ
         0GgEmcI3Y4Uygjhaj7I6oBfMoE4sLvrlqa7dTNijzAys3bYXLB9eYglT3aUeFqRHPxYn
         trEw==
X-Forwarded-Encrypted: i=1; AJvYcCX+3u8uhfJqaBF1MS+ZRC0vfnRSVDi5nfiX96qVaIgrcb6VMwsftOXzr+K42272pYBYThO7XQFxnXl08o7SVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFP5Po9gQrV5P0HgdXgkrSVBou0Ld5dAaIk/xIHv4zjB1E1Wy
	6FtZ1XeussW7VIPIT6wbgGGD8gnQbRU8+lNdDJnP8n3oYV8ATQtLDCQGtDQZ5gAdhvBCkB9II/H
	HxSNr3DxueRxR2xNhxV+b13qIKfXrmhIQxEKi6ZfU7z6IA4jJkovWLxUcdBhS7+AKXb8cvg==
X-Gm-Gg: ASbGncuLj+PcMHxMkDfnnr0HcihH2E3eLHz/bMOPdYDv8pB6ssqycGfZnquJQY6zkyL
	wmBO1hXrpC2bFtg6pN0SmIFiZ8ajhqfjNcSh2RPyH31VfIr7uaS5lTfc+MEwGMMsbP/Egau5IeN
	iG3h0PCM+jxo//gTWGHIYdhkvXzoCd54IEPZCkeqMLjJ3gz+qS+zJoM9j5jEIqibroWVFDBx/WI
	bEG+fq36FeCzoujQwCfOkRxvV3mGrBsf0U8vneALGV3yqiJ/GV+rVUr6eZLWkejXBgdfw92Xbat
	S6PzXFC42S2zh+djBsyOA+hi+xFkdoB68eINecApZ6GNGhCSejBvQHE+QLCMZJjaF0ev26L24lC
	QnCjgq2sBSqepRFFvyUy3/49oWAxeejQrH4RyjiiWxUjAigDJjQV4rEjJ7pmTaP5b85QmpLKUan
	V/DkLsVwxycE1eebt/xiy2Gw==
X-Received: by 2002:a17:902:d2c5:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29555fc6b77mr77376565ad.2.1762163613306;
        Mon, 03 Nov 2025 01:53:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoTGYBeKUah6jDo3wMiAEXeCGSXTu9lbrJNR6GODRbD0jwvT0knofuKnPEVNWTYDIrALEjfg==
X-Received: by 2002:a17:902:d2c5:b0:295:55fc:67a0 with SMTP id d9443c01a7336-29555fc6b77mr77376355ad.2.1762163612832;
        Mon, 03 Nov 2025 01:53:32 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159fc0e19sm391835a91.4.2025.11.03.01.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:53:32 -0800 (PST)
Message-ID: <931eaa75-52f8-4790-9103-02e97b820c7f@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 15:23:27 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
To: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong
 <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <9421ff80-bd86-4b29-baca-c86da90c91aa@roeck-us.net>
 <wxdglhtsss4it6gfm3d7nngi6aezcvpcs44oa5mlmdwe34d5o2@qlkri6oknnpe>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <wxdglhtsss4it6gfm3d7nngi6aezcvpcs44oa5mlmdwe34d5o2@qlkri6oknnpe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W-KCqoc70OqAn-TZhvEcJUtvINRLmiXk
X-Authority-Analysis: v=2.4 cv=UJDQ3Sfy c=1 sm=1 tr=0 ts=69087b9e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rzB8HjGg_Mo3OrOr0-EA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: W-KCqoc70OqAn-TZhvEcJUtvINRLmiXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5MCBTYWx0ZWRfX9T+3vhG4Tufk
 z/UqJDYzR0KgMr5gI7cEBzEvwjeog58TztuQqkid7eqjwqTUt3vD2FTqUxTBg1LAIur+v1Xr7Ms
 Jp7TosckO/waTXmXW22gAeyorSxIPwqlci5Yck7MIlZKQYb1LogDabtN+9I3HmhZgp8P/LbifCK
 Hsm3OSw0z/v6Io3FF3rGbOxrxSiA/Qq/rt8TExLrGagAt/n/CkmSZvY54AJJKcxl/mL2U43JKiF
 TJXgGbAMwyny2xhBJYLde6y9Pa+lwEWclZh3OWiBjvRAJkUsJMFPLbLT1vt9BcCXDrI7rJYVnhS
 v7lG55hHEkyGm4nc8Zq8UVcwbfNwVME4E3dCn9OtKU02epinzenYb0DKB1UlNcAh+2ZzKJk/iIt
 ZmLxDKEGR1rVm50c7y3lvabmKzyx/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030090


On 11/2/2025 12:20 AM, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 08:24:44AM -0700, Guenter Roeck wrote:
>> On 10/31/25 03:18, Hrishabh Rajput via B4 Relay wrote:
>>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>>
>>> To restrict gunyah watchdog initialization to Qualcomm platforms,
>>> register the watchdog device in the SMEM driver.
>>>
>>> When Gunyah is not present or Gunyah emulates MMIO-based
>>> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
>>> present in the devicetree. If none of these device nodes are detected,
>>> we register the SMC-based Gunyah watchdog device.
>>>
>> There should also be an explanation why there is no "qcom,gunyah-wdt"
>> devicetree node, both here and in the file.
>>
>>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>> ---
>>>    drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>>> index cf425930539e..40e4749fab02 100644
>>> --- a/drivers/soc/qcom/smem.c
>>> +++ b/drivers/soc/qcom/smem.c
>>> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>>>    	return 0;
>>>    }
>>> +static int register_gunyah_wdt_device(void)
>>> +{
>>> +	struct platform_device *gunyah_wdt_dev;
>>> +	struct device_node *np;
>>> +
>>> +	/*
>>> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
>>> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
>>> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
>>> +	 * the case.
>>> +	 */
>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
>>> +	if (np) {
>>> +		of_node_put(np);
>>> +		return 0;
>>> +	}
>>> +
>>> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
>>> +	if (np) {
>>> +		of_node_put(np);
>>> +		return 0;
>>> +	}
>>> +
>>> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
>>> +							 NULL, 0);
>>> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
>>> +}
>>> +
>>>    static int qcom_smem_probe(struct platform_device *pdev)
>>>    {
>>>    	struct smem_header *header;
>>> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>>>    	if (IS_ERR(smem->socinfo))
>>>    		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>>> +	ret = register_gunyah_wdt_device();
>>> +	if (ret)
>>> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
>>> +
>>>    	return 0;
>>>    }
>>>    static void qcom_smem_remove(struct platform_device *pdev)
>>>    {
>>> +	/*
>>> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
>>> +	 * watchdog device is not unregistered.
>>> +	 */
>>> +
>> Odd explanation.
>> I would assume that the smem device is supposed to be
>> persistent as well.
> Yes, but it's perfectly possible to run a modern Qualcomm device without
> SMEM, with a fair amount of functionality. So, the reevaluation of this
> decision is grinding in the back of my mind...

One option can be the SCM driver which was suggested by Neil in v3 [1].

Let us know if you have any suggestions where we can register the 
watchdog device?

[1]: 
https://lore.kernel.org/lkml/321f5289-64c0-48f1-91b5-c45e82396ca9@linaro.org/

Thanks,

Hrishabh


