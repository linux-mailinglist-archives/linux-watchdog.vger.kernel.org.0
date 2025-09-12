Return-Path: <linux-watchdog+bounces-4235-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B78B54AD2
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 13:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F191D61686
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 11:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192AC2FFDD6;
	Fri, 12 Sep 2025 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1Vj+uzr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A452E9EA3
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Sep 2025 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675819; cv=none; b=Kkzno9jNencoaoJkOt/jyg+gCYjr3xjiDhAC8XbCEkiAy9v0hVjVqqQKif/UyPXI2LlJyqOqLHCKudNJu3dLWgilywwx1iWwZzOjEGt1AGgpJV5bGF3tUygkaLOI4Hc3bzu6EUH8UTcwynoGEjTeXOklIDDk46G+j+xY1TdBr2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675819; c=relaxed/simple;
	bh=rhcvNmsTzZQHkse9jgvO4F3jLJZazKY8siHVo2PUE/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzjDBCilOhrsIfWLocoJJmfL9ryxzxnpOXCfnHkdSrhBQAj9KunSzvcNcX1/cd2mwGvXtbcw99Y8B54e3Uc0eZh5pfL7R6dpu1T8YvH73Md7cz+1QmBgbiixmtPyCkLAnjv28sYw1VWNC9t4OwXAzIhp2hN87EK62Skahnlvq9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1Vj+uzr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDJD015074
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Sep 2025 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OESG3ssqWgVEsTZ/213k4+I+aFjRTeVrTfjQpSv0v24=; b=S1Vj+uzrLbUhU5Dg
	nTFCr4L9YwdCtkOrCRiT7kEw9+EMghvpwCnF6gs98wTWepW4s88YDWtPGFHxew9H
	4t7eWFFVE9jkKVN7mr2pKHpAvuN+F+2V1jUcF7U9bq5GGGvkc02ijzrMy/U4wMDz
	21TVzfZQF9tCz8cWVXZNJ2W7iOknAUgFs9SVtvimL1Iu9/h7tdbKE7Whb3eef2YN
	FXsJT6KJhtIBiwCbIZGoGLWe89Wmmj3LsOQvoXvW/8tU0WqpWMQoHc8N0d2uT+Tc
	Nb2f4GJFvXNA8nQHRN6mp8FQlOK+OJKOJIdKg2ddopSNzA7Cmg+SCwlMWfhd5uRr
	ymtF8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapuq34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Sep 2025 11:16:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b612061144so1874771cf.1
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Sep 2025 04:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675815; x=1758280615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OESG3ssqWgVEsTZ/213k4+I+aFjRTeVrTfjQpSv0v24=;
        b=pKapDXBCXxEv1o4CohGZWtdY/0+a1WGohYFrXqGnVulgOSydF3jysXtmIUDcIG9R/M
         0BAF6kUEPsmG9BP66gTCg7EZyls+fxJpdMU6g55NQ+eMqtrtRTJNhkf8olBbAKrLoH9+
         eN+KTZZeL/xvnkTwKGP9fV9loH78HBxjSy8YEQInxnW0R32Q21duWKririP3JRQiu+/4
         9+7ySw8g7OV8d42DQgEFsZi2ZweC1ax1Oau9e6oEfLeGFG12CSNc+edAtwdoQGMqQYHz
         EhTOcuqTFcpJ2gusC7advTcAwenlklHpoKK7t+FbVcNH48ZFNV6BtXM9SJ03TKYDqjuH
         0Ypw==
X-Forwarded-Encrypted: i=1; AJvYcCWvaxMEblg55QA8rSFAke+ZwU3NltitvqWb5u7SEoGipv6/13vDjl5xkySYz/BB/OnQkaSRdoZeHh8C0QS96A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKCWMUtBRLj0XK/tpMZiC9XFCVZT8a/+mHR9lM/iBmL1+ys48
	mV3u4/UBFrUEl8a/Y2kQGhNIESJF/VQx2LWTercnTg+bxUcpzVa/7yk+J9jzt8R0ZM7OCf3uCUs
	S7sq/H5ZsIZaQI0lXe5FdQRe7usjT0p1//slSfecKY81/NL5/dAk6ZPAYj3z3CO0ZmXIIW8/sQ9
	thQg==
X-Gm-Gg: ASbGncvBirMEtiC1Di4j+LMgz5pPZ1f+vHzNTyJy4c3pTSsNJ8S4/vzS1o+8ilN8cQe
	mY10sih8n6SATYf4bxXhgvatdF9kUiqvsdKiIa3xi78yPcMaXWNkffYncMQgLn+/StfJANauJlX
	qdvljKfKtzDIHhMsHU5SfWA+O9OGFxgGO9ou+x2Mbqggp8k9MCv10KTVH4I2o0WAY/FiUjI58UF
	8v9GB64/fG5mLoGpns3JwXBz9lmd720wd8DCy04jsmegb7Plz2TDErISWc1PDgNcWVfn5qYYES0
	v3ry5A6S+jO/7XNz9iLUApVMHazdgXSbcvlLc+CoUxEMtej9eNI+IqHh3RDEpTRVnRi5cxUWpiD
	mRVmLOM/LUxITklGaAyDbBQ==
X-Received: by 2002:ac8:58cf:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b77cff3c19mr20844151cf.7.1757675815233;
        Fri, 12 Sep 2025 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6jtjf37Oow/lnm/s5r6GSfkEFCpnLou6DpovhAGP4DVjGD3jXbH8ADRgUAiwdIeHIEMFGwg==
X-Received: by 2002:ac8:58cf:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b77cff3c19mr20843831cf.7.1757675814684;
        Fri, 12 Sep 2025 04:16:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd5bfsm343563766b.63.2025.09.12.04.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:16:54 -0700 (PDT)
Message-ID: <e06183f7-4aad-42bb-8c58-6a0d8b7b60ac@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
 <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
 <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
 <99cacf08-0fb4-4b44-9036-96ea5fe01c10@quicinc.com>
 <e7f0b014-3dec-4276-a2dd-479d4248c7e6@oss.qualcomm.com>
 <499f88af-30f5-4507-a90c-d592d0bb4657@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <499f88af-30f5-4507-a90c-d592d0bb4657@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c40128 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=voeTMfilsXCseR2-0McA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6Vg9GQLcT0dMEUrtDcFhTIKzWc-QW_l8
X-Proofpoint-ORIG-GUID: 6Vg9GQLcT0dMEUrtDcFhTIKzWc-QW_l8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXyS/SIMrUGujm
 br/XWfbHcNAqwHbUiUucGLe3qIdPJDUC811QzheuzxvkiPe7iHHuzUgqzk1wWnsC4EzyGn8fE4w
 KtIaLAECaYj4fiteQLQ31TwF9+3T5fRTzrUQ/1d62qf0a98/laYNOjlZvoyx1ShTRXXzoRgHCwu
 Hllu55NmYyB6udtvVHi/y97tDmlad9D9ro3bccJPwcSNjb/+pFetLad68W3bqlUGi3W+20SuPoJ
 NvMjKp2fwe/C9jfw4NOJA+A1fEZixWUTh6Dq684VamWZOe5wHY+18TQZNPclXlqtipTbpc/2jou
 B7reqOxR6xaZ3jlz74/HCCUxTNnKM85RVgY1/VSl59lu4nCJRrDqLrHYnDM5dcpTl/dcYJuQQSO
 6ACPF+D6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 9/8/25 7:49 AM, Pavan Kondeti wrote:
> On Fri, Sep 05, 2025 at 12:18:06PM +0200, Konrad Dybcio wrote:
>> On 9/5/25 2:00 AM, Pavan Kondeti wrote:
>>> On Thu, Sep 04, 2025 at 05:51:24PM -0500, Rob Herring wrote:
>>>>>>
>>>>>> Why can't you probe by trying to see if watchdog smc call succeeds to
>>>>>> see if there is a watchdog? Then you don't need DT for it.
>>>>>
>>>>> There apparently isn't a good way to tell from a running system whether
>>>>> Gunyah is present, unless you make a smc call (which could in theory be
>>>>> parsed by something else, say a different hypervisor..), but then this
>>>>> patch only introduces the watchdog interface, without all the cruft that
>>>>> would actually let us identify the hypervisor, get its version ID and
>>>>> perform sanity checks..
>>>>
>>>> IIRC, last time we got just a gunyah node. Now it's that plus a
>>>> watchdog. What's next? I'm not really a fan of $soc_vendor hypervisor
>>>> interfaces. I doubt anyone else is either. We have all sorts of
>>>> standard interfaces already between virtio, vfio, EFI, SCMI, PSCI,
>>>> etc. Can we please not abuse DT with $soc_vendor hypervisor devices.
>>>>
>>>
>>> We are trying to make the watchdog work with existing SoCs, so we are
>>> sticking with the existing interfaces. The newer devices will not
>>> necessarily need DT to probe hypervisor interfaces.
>>>
>>> To answer your question on why can't you probe watchdog smc call to see
>>> if there is a watchdog. Yes, we can do that. It is just that we won't be
>>> able to support pre-timeout IRQ. This IRQ is optional for watchdog
>>> functionality, so this is something we can explore.
>>
>> FWIW Rob, we moved on to SBSA watchdog on newer Gunyah releases..
>> Which is not ideal as it's still over MMIO, but there's some
>> progress
> 
> Gunyah running in Latest SoCs do support SoC watchdog emulation, so
> Linux does not need to worry about if it is running under Gunyah or bare
> metal.
> 
>>
>> I'm not a fan of including the hypervisor in the picture, but as
>> Pavan said above, we're trying to squeeze the least amount of hacks
>> necessary to get the most out of existing platforms (i.e. ones which
>> will not get newer Gunyah).
> 
> Thanks for enumerating our goal here. we plan to support watchdog (hence
> collecting dumps) on existing platform where Linux has only access to
> this SMCC interface.

I think you didn't explain it clearly - do we need the wdog to bite to
enter crashdump at all on these platforms?

> 
>>
>> Perhaps we could extend the MSM KPSS watchdog driver (which pokes at
>> the physical watchdog on the SoC and whose DT node represents
>> "reality") and have it attempt to make the SMC call early during probe,
>> making way for both physical and virt configurations without additional
>> dt alterations..
>>
> 
> We have to be careful here. I am told that SMCC interface might not fail
> even when Gunyah is emulating SoC watchdog. We can do something like
> this.

"not failling when gunyah is emulating the watchdog" is sort of what we
want, no? Unless you meant that if MMIO access is allowed, the SMC
interface may still report no errors, even though the calls don't
actually end up doing anything useful

> 
> If we don't find "qcom,kpss-wdt" compatible device, then we can add a
> fallback to Gunyah based SMCC.

Matching on "not compatible" is tricky, especially since the arm64
kernel builds must support all platforms at once

Konrad

