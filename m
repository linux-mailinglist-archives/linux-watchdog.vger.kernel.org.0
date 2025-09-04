Return-Path: <linux-watchdog+bounces-4184-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BBB43A40
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 13:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20E1C483010
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 11:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68EE2F49E7;
	Thu,  4 Sep 2025 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHQKgyeT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4826CE04
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756985501; cv=none; b=Dh6UywaMVrjsh60BRPNfKjY2Fgjx/OYn/YaMKlEcwKrEkOYvGMMRAJ59pyYWtQzBQ7aB/43adpRx/qBIWIrVvdPHnC97cfpr7PIJ7DtbdG5rHXSGrJEQ2SqdRJv6DMeHXGKlXZndjEob4Ns+V+CSxzEaO23ITlBDlAgDflXKipU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756985501; c=relaxed/simple;
	bh=rAALfnxHqaKhs2dQnETIE/DfrBgOvyDsTDw6hkeBqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USJSYJZuPLfM986yiy3s1iPvDV62eusc7q4Tat97mD0ZsG+rKN67pKGZBu7rWSPBSz0mhbxQo7Yn/HAG50zDWMKtsjVgkbsL6lgDtiwXVJxkCqFq0v0wGsMSipOnleo2lfXU08B4V0AvKeFAHZvoGWigRI/K3nUlBWzZeel6RZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHQKgyeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XDIf012198
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 11:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oM+3LmCQmXmSWcFdN4jFgLAQvHu68nnOGl7gbFhODY=; b=WHQKgyeTJA+t0hdF
	Y3HsIk40d6AMq7msZj7vQoxY/OX4XyA6gC26VqCWb3rNsaPIruX6D72AAyZqk/E0
	MZb1/e8MWYzTOoogj+JpZ8dnIE0la5OBW7GDq8hIhfuWQmo9SzbvlHCmCMmldEa7
	hcIKmat8z1/sKrSwL3EEcYsWDfRsL8ozoDCSicNeA2AkRM1jZiTJQ0VWNSa+xKW/
	5MfWP4coxyEUpK2C6NycMVV1u5nW1yzJ5wLYLR55g9LCtTu/pHGX55x2OoQKrnr+
	hZch4Z+KRBwMUxlaIaCgjW5y7tiGC0KyEK4xO5cKmtBbGhamjDbspWTAfyqOoalz
	Gdh/Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj3tut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 11:31:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b48f648249so2674741cf.3
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 04:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756985498; x=1757590298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oM+3LmCQmXmSWcFdN4jFgLAQvHu68nnOGl7gbFhODY=;
        b=S1FN2Npx9b05bX99LdahrFW0rEWqWaOrg9V5ZFP5J7tHLYpym3VhJKjFaq76fmUkW4
         kgKopCffgIKL7obLQiszDgxILvg1zMM+kuFzEPOyXdhwTYbbPjSIqflfgMrxPDfFclUD
         4SViHlla3XYanYBF8OU+aC7bF3bPOeHO71qNTpdzXGBMtKYXwbdJ0LE6haiBRb3MLTV2
         eh97D7YyZZxvkEhocntV/mS6/IcLbT5QozdIAXfoTc8jC9ylQ1TIbNUVDYBNUa7cwagc
         pZITpLm0xGgVbPJVpt61hb9/tmiuDLzakTkbHMDhFZYLU3D/HTJURGM25Zc65hU9LlZr
         qY1w==
X-Forwarded-Encrypted: i=1; AJvYcCXm5Udwdq8wLSutp7BjgFzksxc2ZketKlMIyTc/NC00IbWGUmag/2avHMyXgpd3bkUlS2OMvqPY4aZ2WwcApQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTM1OoxVzBbPk1CxOe4crnyX3mYUqanLcWQy2bleMSBPyTKhO
	XFdf39qLHLncY23To1zI8XLjFa+dKiJUvIH1EGhM5uy474UZDQ3pxnmd1KDewEpap02AbKPOoes
	PYCmuVATn6mX9/V7jU9GqN6X1/pmRcF7TuAscnjNLnXi8bsWYE1CpdTpHg/lk06VzyzmwgA==
X-Gm-Gg: ASbGncsPWi9MzwYNuGfZVQQuSMUlt5KTQcDx210sqUhSoucsMC34XKp+JocioD0vTla
	9XkKAnCQ78b8GrzGEIlTkvBvuNM3+o3fBaigNNEZuHSNpQGA4tCZxNbrZXjPCe8GWOy995UkUgd
	OAHv1pX6VLHHtwQczdXIujfINiPChj8s7bQSNQZBw7T2RUr9wH+LMx83KgN2SMW2rrPFW8LVpuz
	udDi9tMx07GI1x9jrq2fl96sxdBD2f/vxmM4nFprdoaTx3Za1dSFOh6MdhSphBC25hHKXiwglnq
	mJ6hNeGOTOUSxcMEeZ16rh5Tky9ifg51wm/ZCPz8KNfxH9cFlbcgz6hoE+iFQCFNUdVn64AbFg8
	fIM52jyvxbtDiqjTcmRCZOA==
X-Received: by 2002:a05:622a:189d:b0:4b5:d74e:d938 with SMTP id d75a77b69052e-4b5d74edfeemr19082171cf.7.1756985497910;
        Thu, 04 Sep 2025 04:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyimratG0v0rJZ9h4moU0EjyKA3wUxFmTeJvP/OBPnaKd0KPhuJvcfVyUHWIHJApnY48UUQA==
X-Received: by 2002:a05:622a:189d:b0:4b5:d74e:d938 with SMTP id d75a77b69052e-4b5d74edfeemr19081771cf.7.1756985497411;
        Thu, 04 Sep 2025 04:31:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047909f504sm206421066b.22.2025.09.04.04.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:31:36 -0700 (PDT)
Message-ID: <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 13:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Rob Herring <robh@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904001014.GA3405605-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXxlcNDA61bho5
 gIH+O4xLtMuSsFNh4OBElBsN8IgDLAkHiDbBrnp85guYzDnOFHCVYdgXQE3aSaUiNWWAXehuKkv
 yR2NsSsnLs8I3JO8u5c+KVdZ1qs39MrW7vjXirbdvHdDpdf+SFEmx0szFC+7vIumTJfPZFTImRL
 hrxz7hstJBtjk1+WL9rJIlBA1iM5u4a+St7sPjWEZuZjZuswQg8CL5fjiYktZNuW6kWnUq8C252
 JVXjbamU+HFc052SCGaS+zSbBG5SNAiDqbaSV/R7YgTo/ooRmMHVDs1rvo0ueMSJaqlFfOqS4fC
 bttjddLTRLZAZ7bOdSyvoz1uMzujO7c/9svPoI3n9sF05TK91p4Qd1bbVMxQK6NYcTuFrz52QOH
 zkSMnbSz
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b9789b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=dyZUlkJkdh-3oYjz4Q4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: L0OQVgYvlXtxK-B58Mqu0CkJ0JifMyY3
X-Proofpoint-ORIG-GUID: L0OQVgYvlXtxK-B58Mqu0CkJ0JifMyY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 9/4/25 2:10 AM, Rob Herring wrote:
> On Wed, Sep 03, 2025 at 07:33:58PM +0000, Hrishabh Rajput wrote:
>> Gunyah is a Type-I hypervisor which was introduced in the patch series
>> [1]. It is an open source hypervisor. The source repo is available at
>> [2].
>>
>> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
>> access the MMIO watchdog. It either provides the fully emulated MMIO
>> based watchdog interface or the SMC-based watchdog interface depending
>> on the hypervisor configuration.
> 
> EFI provides a standard watchdog interface. Why can't you use that?

The use of UEFI at Qualcomm is not exactly what you would expect..

> 
>> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
>> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> Is a watchdog really a hypervisor service? Couldn't a non-virtualized 
> OS want to call a watchdog (in secure mode) as well? But I don't know 
> how the SMCCC call space is divided up...

Gunyah traps SMC calls and acts on a subset of them, passing others
to TZ

>> This patch series adds support for the SMC-based watchdog interface
>> provided by the Gunyah Hypervisor. The driver supports start/stop
>> operations, timeout and pretimeout configuration, pretimeout interrupt
>> handling and system restart via watchdog.
> 
> Shouldn't system restart be handled by PSCI?

I believe the author is trying to say that the watchdog is not
configurable from Linux at present, and if the platform hangs, there
are some indeterminate default settings in place

> 
> Why can't you probe by trying to see if watchdog smc call succeeds to 
> see if there is a watchdog? Then you don't need DT for it.

There apparently isn't a good way to tell from a running system whether
Gunyah is present, unless you make a smc call (which could in theory be
parsed by something else, say a different hypervisor..), but then this
patch only introduces the watchdog interface, without all the cruft that
would actually let us identify the hypervisor, get its version ID and
perform sanity checks..

I would expect that Gunyah has the necessary provisions to inject its
nodes as necessary, at least I recall there was some talk of it in
early revisions of Elliot's aforementioned patches:

https://lore.kernel.org/all/20220811214107.1074343-4-quic_eberman@quicinc.com/

Konrad

