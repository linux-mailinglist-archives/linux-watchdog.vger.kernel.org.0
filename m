Return-Path: <linux-watchdog+bounces-4492-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CAC25A04
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 15:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47DE74F8D41
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 14:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D804A34C159;
	Fri, 31 Oct 2025 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dbc+8Xk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dS1U2nUD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5234C814
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921422; cv=none; b=mnuup5ah43qAzG8jNMm+ZPpbQAgk6iEW1BN5ZDfYbqkwUPKNBqFw+Hs8sBO/klpsMZIP/JPSK1HjO2CQtweyOJAMOMsdDtPh3FWQ5zsVFZnV9GsHhLD4XNZS8y0xo+OIj3jWtKyNoBNxtYUL2C/QHdCG3PD4BhSmTeE/riVKoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921422; c=relaxed/simple;
	bh=FCwrNOVgBJoqCfZZIt/Nsazx4FGIOxSutIIbm7HQq0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJ/pWs8V4OJwWWZ8GpesM1oHNBUfIJ3iLoyjQfn+2+tvBH1pHCiCFJM+f0FMjDRKyZiKRbTJzydT4iueZix9eSWbK/eaHKuMnNdNZN522Tn803KTYNrjNCXXupAZCsbBQKvM3b28/SLRcZ+7YvZTA91tQYzMpnkcpDwL966K4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dbc+8Xk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dS1U2nUD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VA5HE41417452
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 14:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6DPTsEz9Hoidye1U7fpGpGM
	G3zixuxolSfl2OmZ24E=; b=Dbc+8Xk+LD+wo4+PjYLHGhyHDUmyg1WxIxw/7dWZ
	TMw4FhumWwtYunkUT3R0UnTDlvNq5evf8+I3QDjL1bDq7anBMGBBQs1VbObax7Rq
	wR8Fobm2FnOLoq/RLwcnLVBYKF/c1FD7LY9saK9H/Kgy0yy3Pd33yXSNOpbWenPE
	hzRgmuas3ALMTEBa54Ni9OmToI0MwKQ1FnztP5Vrya1/lnx6vkD+CJBXEC5ToTTd
	uUyL2EVjEjEKuSdnDN5F9bp+vvMauLJFBC0/TaSMEhEBkAJPhN1F1PmoHfspI53X
	uLaXjrQOgtsSO/uMVaWDGHRUr3TNwI3wnFU71qBoiroswg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69j1uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 14:36:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5a6a9eac6daso1004619137.2
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921419; x=1762526219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6DPTsEz9Hoidye1U7fpGpGMG3zixuxolSfl2OmZ24E=;
        b=dS1U2nUDsejBWb0PQMWBJRlyFrSfeYEF7pd2B9q/rlH/FW752mkL7Zf41Xv66MOl2Z
         9b7SWnkR8h1uEAKwJasqDAr3KRa91Sbkxc2Nh5jEctc/2iUWkE25tfyXgWi8LcXoYhD8
         v5Qzq6mJfJc/Df5v5/NedPpHFIKy1W0ajdjY9OmJyOnKvwQe3UZFQ/IXjj93BLC9BNuI
         1JKC6BWD2MMKCeE+ytD5REeiV3Kn0JhGDQh9YTyeo6L4bK0MWoaDFoOq0qhRAei0enns
         oJC51ZIGJzNbawW4yNyqPj+Rg3dEoANNUaVH3EOEh4KnXDvw6jVwh6UTOXE58sgsZqtE
         4ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921419; x=1762526219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6DPTsEz9Hoidye1U7fpGpGMG3zixuxolSfl2OmZ24E=;
        b=hkmFOPoQ2Y6o8OAmby9ciQ6TawK6fKhX6YwkjyUUMzlCM9oitvD3Y5b8ugSlAbr2ay
         X4LUj6CbGJPad3MVtAb61UFz7/PhNzz9/EGKJYn8RP9VFo4jtb6IbVrFJ5FBL7djFwXO
         RlSDR1J5zxEgidxZx3KPbdhm3E18MYA7inT4LCmJKXCvlLtlBwNkbH2oHOfWtdypBZe6
         dGkEwzd+STL1tmXsC8pjCtbg4CYss2M3NQJS2UhrbjusLIHymbveiHxL0NvyivMIAyNk
         Ua4NjtGsYliRYPcXspT+e8t8rxr/JKb0EO3w4Mdv+hQwEDxk8bnrEMzsS2R6GEZHjV5O
         VKCw==
X-Forwarded-Encrypted: i=1; AJvYcCW2ASMfHhRLVmjBMQUrAcZ/N6i6QnzdWYn7E56LgAgy9V4VonUTsVPPPzwOUDv2d13wg+sE7nJJLuhI7TM+Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHMeOr+L5H9orEYSGs+8TIT+6CUnRaDly70dLt1kn/c3RESwUp
	7UTUKuwrrA16lrBlgBagaqyAorEX2nZb2El9oGHbInDLpbRB08rIKDtYUrdndeVUFilg1o8un7A
	GPAW76L4kgItQdUGvkkTk2T6oZBUawvQCdMVde0ZENyLzjIfUG21LGD7Kw5WLSlorMjf3Sg==
X-Gm-Gg: ASbGncvaFs1k6pTYdGer5Hfm//9QB5uBShur0hpjIt+GJhbcqVGjGzFf7LfrfTWuFPH
	UQrMvE5TEet6ops8u0YcGS4SsMft56zdrzROyJIXPDLclq22VEZ+ClepaFYvznVA/zgMTuKtduF
	SaGaWylsFoeDMRyp0haEyOqZ36C0SIS5TbK/A4VZfnHsjXAgejGIHK1oyFesPAG/qYdskW3Cowy
	9rs0ItZf9Ws/DCDweYtmOd8CrGg+x9ho5dBj17EiGvzm3e878AQVounNGvgo5GGimhffpzocRQq
	FpeLpT7ih8SCHN/jipC7bhjaZKE4Qkm9jL95BUR+ftodMUo+aD4x1UfWhqGnjULxc1P9bjChP2y
	3UthpRXYdaPRuq9VEK+1P/ex+TZnr0heex/e3A8umSr8fFXAbRVBDbe8awui3N9h9r23BB+CodN
	XZv0/R2eeuW2F7
X-Received: by 2002:a05:6102:290d:b0:5db:54fc:367f with SMTP id ada2fe7eead31-5dbb1380d64mr1009311137.43.1761921418691;
        Fri, 31 Oct 2025 07:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2wCz/6ZpIvBfHMa4mOISCQEgdVvHRJ7mV36QpziNa7UDGwchWqOCd1bec314NpzrV6RYgkQ==
X-Received: by 2002:a05:6102:290d:b0:5db:54fc:367f with SMTP id ada2fe7eead31-5dbb1380d64mr1009294137.43.1761921417954;
        Fri, 31 Oct 2025 07:36:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bbf2fsm553132e87.81.2025.10.31.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:36:57 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:36:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <4bxoananq55f7u4kckqjof37or6fflppmbyyc3j6noodzr75nt@vtfxbnhrcgzy>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMSBTYWx0ZWRfX6VwCbSvtZ+U4
 uiGKe1In1DJtURASlatGUaKFtCbzbDtE9V56O3MneZv0nv6+hMWhj0as8cGIB11mwFZobCZOY+j
 7F6KZLhiQplS7qMIMO5iMIOYyg2gc99XscqfJiu/h1Pr/mkcAsgXIWFObB03EczJAp0zISrenMp
 DFBnypBb8JTvSkfTGkgLCXJ0nZrW41P/Y5RcrP55wEkmDbLa5trloT0UwxpB20g2y/8ahF+MrEe
 4w2gHzFtxnga/Ne+ceZ8S4xJ7FWhejoTSuMu/QuNEnF6G5+z/aE++1+0Rub080JaUGlu/OfhhOW
 +Q2WwPN8IO/DfXhM1I4/GjsEPk1QBqmuQj4KwK7DlaWd+jQAI4/otZGjtMXyJRV7PKZ1fj8KuXT
 xOURg69DQFsZ8BR0/gtMMVx3ZZ1CZg==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904c98b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DeGy0USLYTGV0esLX_YA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: qaA49E0_otdBJHbS32RSW5ig6eT7ww22
X-Proofpoint-ORIG-GUID: qaA49E0_otdBJHbS32RSW5ig6eT7ww22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310131

On Fri, Oct 31, 2025 at 10:18:14AM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> through MMIO is not available on all platforms. Depending on the
> hypervisor configuration, the watchdog is either fully emulated or
> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> Specific Hypervisor Service Calls space.
> 
> Add driver to support the SMC-based watchdog provided by the Gunyah
> Hypervisor. Device registration is done in the SMEM driver after checks
> to restrict the watchdog initialization to Qualcomm devices.
> module_exit() is intentionally not implemented as this driver is
> intended to be a persistent module.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/watchdog/Kconfig      |  14 +++
>  drivers/watchdog/Makefile     |   1 +
>  drivers/watchdog/gunyah_wdt.c | 249 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 265 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0b444e5fd5a..56dbd0d3e31b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3083,6 +3083,7 @@ F:	arch/arm64/boot/dts/qcom/
>  F:	drivers/bus/qcom*
>  F:	drivers/firmware/qcom/
>  F:	drivers/soc/qcom/
> +F:	drivers/watchdog/gunyah_wdt.c
>  F:	include/dt-bindings/arm/qcom,ids.h
>  F:	include/dt-bindings/firmware/qcom,scm.h
>  F:	include/dt-bindings/soc/qcom*
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0c25b2ed44eb..f0dee04b3650 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2343,4 +2343,18 @@ config KEEMBAY_WATCHDOG
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called keembay_wdt.
>  
> +config GUNYAH_WATCHDOG
> +	tristate "Qualcomm Gunyah Watchdog"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on HAVE_ARM_SMCCC
> +	depends on OF
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for watchdog timer provided by the
> +	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
> +	  to interact with Gunyah Watchdog.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called gunyah_wdt.
> +
>  endif # WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index bbd4d62d2cc3..308379782bc3 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -102,6 +102,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>  obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>  obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>  obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
> +obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
>  
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
> new file mode 100644
> index 000000000000..bfe8b656d674
> --- /dev/null
> +++ b/drivers/watchdog/gunyah_wdt.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

Is this header used here?

> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
> +			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
> +
> +/* SMCCC function IDs for watchdog operations */
> +#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
> +#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
> +#define GUNYAH_WDT_PING      GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
> +#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)

What about calls 0-4?

> +
> +/*
> + * Control values for GUNYAH_WDT_CONTROL.
> + * Bit 0 is used to enable or disable the watchdog. If this bit is set,
> + * then the watchdog is enabled and vice versa.
> + * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
> + * it's expected to be 1.
> + */
> +#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
> +#define WDT_CTRL_DISABLE BIT(1)
> +
> +enum gunyah_error {
> +	GUNYAH_ERROR_OK				= 0,
> +	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
> +	GUNYAH_ERROR_ARG_INVAL			= 1,
> +};
> +
> +/**
> + * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
> + * @gunyah_error: Gunyah hypercall return value
> + */
> +static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
> +{
> +	switch (gunyah_error) {
> +	case GUNYAH_ERROR_OK:
> +		return 0;
> +	case GUNYAH_ERROR_UNIMPLEMENTED:
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
> +			   unsigned long arg2, struct arm_smccc_res *res)
> +{

	struct arm_smccc_res res;

There is no need to pass it through arguments.

> +	arm_smccc_1_1_smc(func_id, arg1, arg2, res);
> +	return gunyah_error_remap(res->a0);
> +}
> +
> +static int gunyah_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +	unsigned int timeout_ms;
> +	struct device *dev = wdd->parent;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
> +	if (ret && watchdog_active(wdd)) {
> +		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	timeout_ms = wdd->timeout * 1000;
> +	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
> +			      timeout_ms, timeout_ms, &res);
> +	if (ret) {
> +		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
> +	if (ret)
> +		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static int gunyah_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +
> +	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
> +}
> +
> +static int gunyah_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +
> +	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
> +}
> +
> +static int gunyah_wdt_set_timeout(struct watchdog_device *wdd,
> +				  unsigned int timeout_sec)
> +{
> +	wdd->timeout = timeout_sec;
> +
> +	if (watchdog_active(wdd))
> +		return gunyah_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct arm_smccc_res res;
> +	unsigned int seconds_since_last_ping;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
> +	if (ret)
> +		return 0;

This is the only place which passes something back in res. Please wrap
it separately and return int value.

> +
> +	seconds_since_last_ping = res.a2 / 1000;
> +	if (seconds_since_last_ping > wdd->timeout)
> +		return 0;
> +
> +	return wdd->timeout - seconds_since_last_ping;
> +}
> +
> +static int gunyah_wdt_restart(struct watchdog_device *wdd,
> +			      unsigned long action, void *data)
> +{
> +	struct arm_smccc_res res;
> +
> +	/* Set timeout to 1ms and send a ping */
> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
> +	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1, &res);
> +	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
> +
> +	/* Wait to make sure reset occurs */
> +	mdelay(100);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info gunyah_wdt_info = {
> +	.identity = "Gunyah Watchdog",
> +	.firmware_version = 0,

=0 is default and can be omited

> +	.options = WDIOF_SETTIMEOUT
> +		 | WDIOF_KEEPALIVEPING
> +		 | WDIOF_MAGICCLOSE,
> +};
> +
> +static const struct watchdog_ops gunyah_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = gunyah_wdt_start,
> +	.stop = gunyah_wdt_stop,
> +	.ping = gunyah_wdt_ping,
> +	.set_timeout = gunyah_wdt_set_timeout,
> +	.get_timeleft = gunyah_wdt_get_timeleft,
> +	.restart = gunyah_wdt_restart
> +};
> +
> +static int gunyah_wdt_probe(struct platform_device *pdev)
> +{
> +	struct arm_smccc_res res;
> +	struct watchdog_device *wdd;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
> +	if (ret) {
> +		dev_dbg(dev, "Watchdog interface status check failed with %d\n", ret);

dev_err

> +		return -ENODEV;
> +	}
> +
> +	wdd = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
> +	if (!wdd)
> +		return -ENOMEM;
> +
> +	wdd->info = &gunyah_wdt_info;
> +	wdd->ops = &gunyah_wdt_ops;
> +	wdd->parent = dev;
> +
> +	/*
> +	 * Although Gunyah expects 16-bit unsigned int values as timeout values
> +	 * in milliseconds, values above 0x8000 are reserved. This limits the
> +	 * max timeout value to 32 seconds.
> +	 */
> +	wdd->max_timeout = 32; /* seconds */
> +	wdd->min_timeout = 1; /* seconds */
> +	wdd->timeout = wdd->max_timeout;
> +
> +	gunyah_wdt_stop(wdd);
> +	platform_set_drvdata(pdev, wdd);
> +	watchdog_set_restart_priority(wdd, 0);
> +
> +	ret = devm_watchdog_register_device(dev, wdd);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register watchdog device");
> +
> +	dev_dbg(dev, "Gunyah watchdog registered\n");
> +	return 0;

return devm_watchdog_register_device(); No need for extra processing
here.

> +}
> +
> +static int __maybe_unused gunyah_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		gunyah_wdt_stop(wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused gunyah_wdt_resume(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(wdd))
> +		gunyah_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
> +
> +static struct platform_driver gunyah_wdt_driver = {
> +	.probe = gunyah_wdt_probe,
> +	.driver = {
> +		.name = "gunyah-wdt",

Missing platform_device_id, MODULE_DEVICE_TABLE.

> +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
> +	},
> +};
> +
> +static int __init gunyah_wdt_init(void)
> +{
> +	return platform_driver_register(&gunyah_wdt_driver);
> +}
> +
> +module_init(gunyah_wdt_init);

module_platform_driver();

> +
> +MODULE_DESCRIPTION("Gunyah Watchdog Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry

