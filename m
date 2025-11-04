Return-Path: <linux-watchdog+bounces-4509-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D28C2F554
	for <lists+linux-watchdog@lfdr.de>; Tue, 04 Nov 2025 06:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E483F4E0131
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Nov 2025 05:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE8D2BE7B5;
	Tue,  4 Nov 2025 05:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I78XV9mk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEgm6q7n"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF364285CB6
	for <linux-watchdog@vger.kernel.org>; Tue,  4 Nov 2025 05:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762232644; cv=none; b=E1y3zes4i3pTb3JLEOOZ8kdwU//GE5VpRPU/5Gx+HYsTM4nJcrKSqB+Byrc0OztxX9e+31LnnO2MkyWNSp+SpOg4hqVdxbD0TmIPapqcTsCIqRrV7zcTTgqQQfnh6nsbAY66p54bHaB9gRvxZTjjnZei8RvbgdEm9ndCBo86iKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762232644; c=relaxed/simple;
	bh=7ahORK56Ji+xG3X89Vnujuhts7WNYej9lQCD0HUx3QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uB3Rh72GVGjyfgrBiBiaQni0GYIgPrSIiygiYN9OOmg0rvakCvAkdkAY7UdPox7JIncd1BAbH6cELkBVSPrtLexDXlU6uJf86lfsNXmOXOZzzzeGCjaPNxrUjd5z3xBJeqr3MzirQ2PNV/2daFCjjZLRsa/jaKzcBTYoP2j3kQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I78XV9mk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEgm6q7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43PAsT905319
	for <linux-watchdog@vger.kernel.org>; Tue, 4 Nov 2025 05:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1lcbXDQCbFGlQ1qumczHxP0u
	BwOAwPqDfJc9RgHWN7Q=; b=I78XV9mknreU+VPqdvJZhXARFXwLPyzdskoZgal1
	IDmo90cjvNmLwLgBNGwsO7j0F6ogiXgxbIAQX040z1oMFF+oYHUKiHHIx/Iff2ak
	Wtv48k+BEtU9GHM+UHq8OCaYLABx0XqeW1D4eDbeFeMYoag2QA58JwiPA2ogEFqn
	ZFJJduvGj3xZCSBxNvk/S4+f2fXCDQC6zi8Gw3UeCWKmB3DEpI7GQe9DR/9hI9zL
	Y/hpINGnlrLKiaJrgrVj2akLIXR8FAsiHDzVVrlmbnxzSIMvFZWO3AjvBkj2vdOT
	55zzx/7uA84x1Dc3FiSaNf/MK8S/x1rXuq6hAp1A6YvaZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjr70v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 04 Nov 2025 05:04:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2904e9e0ef9so121034995ad.3
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Nov 2025 21:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762232640; x=1762837440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lcbXDQCbFGlQ1qumczHxP0uBwOAwPqDfJc9RgHWN7Q=;
        b=WEgm6q7ncRRTi1xEb0EI86igrN7xFS9LarKaFjUKMvhHl4SMDwsRF4ggFuVFhYRtjb
         P4yD/YPFy6CK2vSQcy2iiGp1QGiZeqRtvBBsf34d1pPoyBBf4So6KwYgPsGCE9fluvpA
         UvCcM85z6Vn+11BYIR329pfMoHNPq+dvarp1O5fbgQWlK8LChtXg0DPxqowc4oLFl5jy
         GRVCL8BcLV5oskkoYSYDhenMmkJKMtOpPO8jakcXgt2VSFtRD/Q7LyTHhX1FnqnnTq8Y
         6UEJxSeH8KbcokWUqv75NqBjncaiAYGb1HxnJb+DqOOenVjowFNyKcT3CgSxMP+AnM1q
         SI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762232640; x=1762837440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lcbXDQCbFGlQ1qumczHxP0uBwOAwPqDfJc9RgHWN7Q=;
        b=ka59xaBi/1+VAjVQ+UQqe7tushZR3R4aFS6spmQeWYcxZOXwThD5y5yVp1nXSCK8ie
         nTP4Xl6it8jQrJ9bBG45q0W8/rMNIASEzGChZvLT6vbclob5zqymg8jCGlUBhDG66csC
         7SSqmzpWPwG2JEAe1dZkEE0oFxBy3rdqJeeF93KuNAuFm8ozGK6a6nExeAO2grqZiJ0I
         c/IlztGQIYOZof0qJLDBCC7OEHLE3ZHZNU6Nd9K5UkGuupWCM7BBuycEFoc6xJFbtQOy
         XL0jumPTyD//zwKDYaVXQlyGOXGSs+ES/d9bmUFQXL36JTl695LuGNMGvbxTI2sSwx2c
         DBhg==
X-Forwarded-Encrypted: i=1; AJvYcCVtnatIpdnlNVozl1YVGFatJT79QghptxRaEhjX+cUbPto0c5whnrp2NwcoIRugRezsuBAO2a+qZZuoZn2LmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI051AzDq5gRYV7tcWwZjYEi8sC3LLhXblnkIdkrcImCvFtAYb
	BxvnTPVx08QJ+0OzhFpcIuWtbFt973fWQ9W84PZMiFeCSEErFzUbagryx9d30borTYHOWCazTLF
	zRoVIMa4g7aDu/YOXWhU11+AtyxWdunu5U6UMw3waqo0dDXigfttxbnX9oTp6CmsXZH1jWQ==
X-Gm-Gg: ASbGncu2/KVG14CLocMbfiCfWdlDERNGWIaAo5k90BvYBoWH23SU8b5M2HBmR8Jwj8+
	v1qPQiLbM3HST7S/8VY06UfMajfHbZbl6ioLKzcBC214r7lWELYAvBhn+ndYc4yOY2TCuulKah1
	zNkQ6flWNiPcrj0iQmoWns2C3VGlDrGKr48iflNVpA0Hk3Np9hk8RxMIVJ7r1jzGXGUBPJEbmH4
	qYVQqNwpQ1Zimy0I4538iXj2rl0Jl8jI/cH60Jz3Urg2kRGcz+bpiUHK38dNHA53EufEtS5wewo
	z9ZLIws13mk/bBkjhQo2mYeTO5BpLV3sayTCmYMPfqh3vyT2GAHKnuzgQemA0OQgQLUqRSZiD5Z
	GEcXObAYniQQ3nhjIG3wCatyzghi/5zcY
X-Received: by 2002:a17:902:ea0e:b0:273:ab5f:a507 with SMTP id d9443c01a7336-2951a3e6136mr219334935ad.21.1762232639455;
        Mon, 03 Nov 2025 21:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXmDw/J8solbX98U9JGXASqPQ7jI05mi4jRrsOQx95DzTgD/uBh8QIFNA96fGs16AgEAxB7A==
X-Received: by 2002:a17:902:ea0e:b0:273:ab5f:a507 with SMTP id d9443c01a7336-2951a3e6136mr219334525ad.21.1762232638744;
        Mon, 03 Nov 2025 21:03:58 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998671sm10391285ad.35.2025.11.03.21.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:03:58 -0800 (PST)
Date: Tue, 4 Nov 2025 10:33:52 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <2ef1d795-5cdd-4465-9333-16a02207a806@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
 <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
 <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>
 <ykg7mwgncmvdap6xzyhmgxu6ur62zzfk5nd3tqrkivugn4w474@rkazrlhwbhtj>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ykg7mwgncmvdap6xzyhmgxu6ur62zzfk5nd3tqrkivugn4w474@rkazrlhwbhtj>
X-Proofpoint-GUID: GGK9ZlEZA8kHh3_o8Grm9cZS1JftGXn5
X-Proofpoint-ORIG-GUID: GGK9ZlEZA8kHh3_o8Grm9cZS1JftGXn5
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=69098940 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=yMhMjlubAAAA:8 a=EUspDBNiAAAA:8
 a=NmRg-prKhgx6galY42cA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAzOSBTYWx0ZWRfX5MFnReG0EfwC
 K18d4AaKN0UPouEv0EnQ25DedYajPQGm4wq92pHtZgpQK6LPjXeTc7SMZrwvIMlR7Gtq6aM8jKo
 uLjLYoS/HadxQArsVhNOT+pZbLz7h/ypUVAxJO1KVk3IunxLeGByFjE9oWj/qVAMtXQBFw68Xt7
 w5J0/M6YyfgV4qm0g9gNQM1RvtVcq9pOU+dSr+LUHE9b/4e1yj3NnQOLyDpbQcBZ0hil1NfQNYY
 juCylBsDs/MCfnXNJ/uCUEdyi/iLDdBQDND0lJPtWNSwBeEOyzr1krAJVwomF7w8FKbMwU6LzIk
 6IAb9SMaWNnc9XcyJdEQMrxS7iPF3yLj9aefTp3Sgwq0xV5hmjRyc691kexhGqqkuX8b6UMtksA
 R09TGI5tXCIAaxEsJQbVgWnnoa/wXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040039

On Mon, Nov 03, 2025 at 09:52:25PM -0600, Bjorn Andersson wrote:
> On Tue, Nov 04, 2025 at 09:00:27AM +0530, Pavan Kondeti wrote:
> > On Mon, Nov 03, 2025 at 07:01:51PM -0600, Bjorn Andersson wrote:
> > > On Mon, Nov 03, 2025 at 04:03:44PM +0530, Hrishabh Rajput wrote:
> > > > 
> > > > On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> > > > > On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> > > > > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > > > 
> > > > > > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > > > > > register the watchdog device in the SMEM driver.
> > > > > > 
> > > > > > When Gunyah is not present or Gunyah emulates MMIO-based
> > > > > > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > > > > > present in the devicetree. If none of these device nodes are detected,
> > > > > > we register the SMC-based Gunyah watchdog device.
> > > > > > 
> > > > > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > > > ---
> > > > > >   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> > > > > >   1 file changed, 37 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > > > > index cf425930539e..40e4749fab02 100644
> > > > > > --- a/drivers/soc/qcom/smem.c
> > > > > > +++ b/drivers/soc/qcom/smem.c
> > > > > > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > > > > >   	return 0;
> > > > > >   }
> > > > > > +static int register_gunyah_wdt_device(void)
> > > > > > +{
> > > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > > +	struct device_node *np;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > > > > > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > > > > > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > > > > > +	 * the case.
> > > > > E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> > > > > arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?
> > > > 
> > > > 
> > > > It doesn't implement Gunyah watchdog. For platforms like these we've kept a
> > > > STATUS SMC call in the gunyah_wdt_probe().
> > > > 
> > > 
> > > I think it would be good to make that call before registering the
> > > platform driver.
> > 
> > Did you mean platform device here? Becase we don't want the gunayh-wdt
> > module to do anything other than registering the platform driver on
> > platforms other than qcom.
> > 
> 
> Yes, device, not driver.
> 
> So in SCM driver (I think that's a better match than SMEM), do a:
>   if (are_we_running_under_gunyah())
>     platform_device_register(gunya-wdt);
> 
> The Gunyah WDT _driver_ should based on that be autoloaded by the
> platform:gunyah-wdt alias.

Thanks for the clarification.

> 
> > > 
> > > > The SMC Call is expected to fail on platforms which do not have support for
> > > > SMC based Gunyah watchdog, which in turn will fail the probe.
> > > > 
> > > 
> > > Perhaps I'm missing something, just looked quickly and it's been a while
> > > since I looked at this code, but you're making a HVC (or SMC) call with
> > > the function:
> > > 
> > >   ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, ARM_SMCCC_OWNER_VENDOR_HYP, 6)
> > > 
> > > which doesn't look unique to Gunyah in my eyes.
> > > 
> > > If I read correctly, the ARM_SMCCC_SMC_32 is the only bit (literally)
> > > that differentiates this from being a __vgic_v3_get_gic_config() call in
> > > KVM, just as an example.
> > > 
> > 
> > Yes, you are right. This SMCC falls under ARM_SMCCC_OWNER_VENDOR_HYP
> > space, so it would behave differently on different hypervisors.
> > 
> > Please let me know what you think about this **defensive** approach.
> > 
> > - Move the Gunyah platform device registration to SCM driver.
> > - Checks to be done before registering the device
> >   - Make ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC [1] to verify that we are
> >     running under gunyah
> >   - check for the other wdt devices like kpss, sbsa in dT
> > 
> > ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC will not be supported by all
> > versions of Gunyah, but atleast it would confirm the definitive presence
> > of Gunyah.
> > 
> 
> Yes, this looks good.
> 

Thanks, I think QCM SCM driver hosting this would be a good idea.

> I presume if we determine that Gunyah is present, and we haven't put
> sbsa wdt in place (e.g. during bringup) Gunyah and Gunyah WDT will
> handle the outcome gracefully...
> 
Yes, we are told Gunyah support SMCC based WDT even if it emulates
SBSA. Most importantly, we have STATUS SMC in gunyah-wdt probe before
registering the watchdog device.

The following two patches which merged recently will make the above
implementation simpler. Providing them here for the reference material
for v5.

- arm_smccc_hypervisor_has_uuid() API addition from
https://lore.kernel.org/all/20250428210742.435282-2-romank@linux.microsoft.com/
Please note that recent commit make this API available for SMC conduit
as well.

- qcom_scm_qtee_init() example from 
https://lore.kernel.org/all/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com/

Thanks,
Pavan

