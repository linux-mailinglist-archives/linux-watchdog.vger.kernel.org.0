Return-Path: <linux-watchdog+bounces-4493-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2121AC259FB
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 15:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E1E40030F
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1600734C9BB;
	Fri, 31 Oct 2025 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl3fuCcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODVHZrMv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50D346FD9
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921647; cv=none; b=bvbsvVN0KY6vh9OPZ9RQGGEdG3wpz7vbaVOpEL1tthpDy/7oQbtfLjFZfEyFRKwOZIDtE2Z0/wM3cOokTJ5sd2wgvBgUAmIu675LfGgoWi/vI6Zw9+jw7zDkSUWU0s1M1YgKswA/x2gg9edg2OpBA4xvRlDH5NFIu4RY6/D6jeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921647; c=relaxed/simple;
	bh=1WjeL52Ou5NBeKCANEfpX7bxhAFnFSpBFQ1ir5Aps24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMGJZPMUuJPh9nbjYlQ0zT4ueZefQfg/L2RQOl/nOi/iijACgt/eEqxxSuxBl0HwP2nrrEgraibBglvlgBPVyK+x0bpI+/Ud/Hb0fVM4N5Np8XO1MIF2w9mFUXnq0mCpgGYNy091akk4/YhODMqxekNGciu7BBa87wxIS8B/Q7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cl3fuCcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODVHZrMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VEVb9P3115480
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 14:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x6u3aryrAWIuWoxLABamr7dh
	kWuzvuraC8U4rGQdnls=; b=cl3fuCcqncR2Tai7Am7sixA6EAvM1UqEpDf492cq
	CV8LT/JoTCODQ9BvIi5am5bAnuQUDSA5ONGc7P+UbWfs4IBjiYDYt3BEuSGaW/ue
	M6RE+pUc7zSemn9UI68lPt7QusZpo5aXf3vSHgSy6QU2EEmoweCgOtX+u24K7TbA
	cSvWEoCRx32H97SeEzvXwosr4IsL3XJUd3Kd5tw4NUKRjfswjgjGBvvn3A/UogN2
	PBd08b0BXxz9FstY98MQBzXvkeRgLXkwQVDz2N6xCJ6KSK4uyZ6FVyJ8N2P0uD9a
	NEO0FcEnX9dWh1xtQvyuX0wk1O7/ekcXjOTu0XzjPAV6DQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b44ftk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 14:40:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8984d8833so102136441cf.0
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921642; x=1762526442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x6u3aryrAWIuWoxLABamr7dhkWuzvuraC8U4rGQdnls=;
        b=ODVHZrMvRiAMSLOCFgN3kvo8fz4/RjJTMoE4hbmrzkGtXwPfsGZaRLRfbU4nCkOupl
         Yiw2dSYclDPDhNgpBwDnWFEQd6CVr5Pfkh9ErNJ9gqDUiKvC9m5QdcujCe2KDvKHsIT1
         mg5c29meIlVpnn2L0qqY/aT4ZuQct/1anMbRxtL5C9UyG6FBtvIGg4wIauwSCUQbba8U
         QEC2gSRAe22ElmbeDHLhfPxM1ksnyS4iXwJvBNU+z7pS2sZlMbV8K7jpd3Fjp8o5J7dJ
         Xm7nIrksOD0FLMMsbYzCS/Sys4knPfPo1KLnG1/KiwWUaOuvnPbSO0R15a2+kwq4sXoS
         QV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921642; x=1762526442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6u3aryrAWIuWoxLABamr7dhkWuzvuraC8U4rGQdnls=;
        b=sRbzTDNfTOoHh9NaenMk+YhzAw9fV5k2sLu/dJj7sU9q1+20A/8DY8CLkQdb4lu4CW
         TWWc2Lw1RzdTp16BOUZn81rCJ40oJy27UBlZ+zlBxRzhWbMS9IFXdLwydDUaZnNfJYxk
         +KVqttm836Ns4VqaZ1pgjO/PcloD/N3SX8TjUxuFSbk6fm3ADJsxs0eCGmE3IqPwHOw4
         RfI0T6ksYwq7+Mjc4ZPpmFvO2T0weoqR6TfGxveWE+nXeh7uQOhiCDMcEYvZdrXTW+Xr
         6HuUJsBcA7RZ2w4uJUGGGBiGQhSg2ck+cI8a+8ira1WkV1nbJxhGCj2G09hYx078jeyh
         wXWw==
X-Forwarded-Encrypted: i=1; AJvYcCX2fvzeFWY87OY07p1rEJNezeEzTtRApGticMr5md/WYI1zwR3WMdxxZZG+OIE/LENsrRsgUT0aKzH21s6zeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrBBHndGFI6DersScQDWIsa7mfp/DzVek3790KnNfqGcghv/3p
	tEWebQW7dvPf4yoJHa7FB5qW4Q2dRpUJ3bIzKd1aTJCMw0XTrlUDUTWilkAaG6lf4YMoNGqg1wc
	8S4/NDCSbSLl0KSYoHX8qAQnubkUHbR90SLMYWv850YiXJjq0m6OG2en4x2S9F5JSBOmIxQ==
X-Gm-Gg: ASbGncvg2x+RKtTB3qXzeVmtyc4029hyZ3gb0hkWTldE5xZlBTzmJwprTK+b+JrcA4L
	wPrHOxQaRL0lKgsuCGW8HkWVm4IRUd8DgEX9U6rC/P4lFo9Nvbt7+E1IAhppDoVAraxHkm6OWAC
	WOg7zgfdpcgFAsrAs3fMNSAUTXOJwfpJ/s1sO0FlEFSwxOHtCGmV5AnmWt72nBoMDIpkX/o+Awk
	6i+g5hwRhthseh0jQAeaqhp28sDWluPRx2dgizg0N7aVxrIyoumbb3n0dKDQX9L5YVwnllz4Pnt
	GGi7ccNsCIgD5LNf+ldPSzzT9kebtjJRxH6iBJCsv+hG4cNiCWkQMPaWY9CkqiFhGzeZzHwaVDS
	CeGNv7FdxCov5ey0EIt8efpqrIIRylNwwqcQVVdkM5T10XCJ4TFREoNy+Ni8zDet9AKcfKr5CmX
	CibPX8WEOEkG3Z
X-Received: by 2002:a05:622a:987:b0:4e8:85e8:801a with SMTP id d75a77b69052e-4ed30f8737fmr49106431cf.40.1761921642011;
        Fri, 31 Oct 2025 07:40:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2+ettvTm/rlPxr5+QDWURz0RmtxNkaZagWptKT2OOfzSE65n8XvrjFNhfMMIWI1cGq4DZQw==
X-Received: by 2002:a05:622a:987:b0:4e8:85e8:801a with SMTP id d75a77b69052e-4ed30f8737fmr49102621cf.40.1761921641100;
        Fri, 31 Oct 2025 07:40:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5c27a4sm531517e87.106.2025.10.31.07.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:40:40 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:40:37 +0200
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
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <jnm4djtfiimdj52cg6cfm2kki3munecvbq4rilmqwg6be5y2tx@kxtrthcnee33>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMSBTYWx0ZWRfXxH5SDxKSbSAQ
 8BkwZkyYKv8Y+OvF+9OdUXW4xDI5YGsHBJlANao68uV7kJmcCrJh9st11TvGV2fZgKcT7xcSymj
 GJAThEZN8/Z1Qwf6/j3dGMk3yBdJaBkqTfvRr/wc3CKoe9ejWhnOJPxKjB/tWPeUhXvCHycGFB/
 CRggsm9VTgQBGmisSMlsO5mP/8ggwawThHf6U8kRsztMPwTD+tHU5zskRO9to/SGd1mwdGE6NxF
 XZVMAVCcvEeAbEf9O9Q8ftgT9+bR2PSvktubyAVi5qISlxHz9H8t0xmMApjQea81kajOxN56JA4
 pCvo3fa9xmQk+SqosoN9ynnRetGl33IdVCt96kvP+YBb76xHTOrP64ObUr8q7sSDL+4KPMzTyfg
 I5GEsMptXtdi/gmpTLKQ0DmPLAUXBg==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6904ca6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kq2FUEKZF3Nr8Tfa17QA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZIq1LJsKX_AQPWQE2c51UmiHrnrDlMBf
X-Proofpoint-GUID: ZIq1LJsKX_AQPWQE2c51UmiHrnrDlMBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310131

On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict gunyah watchdog initialization to Qualcomm platforms,
> register the watchdog device in the SMEM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based
> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> present in the devicetree. If none of these device nodes are detected,
> we register the SMC-based Gunyah watchdog device.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index cf425930539e..40e4749fab02 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>  	return 0;
>  }
>  
> +static int register_gunyah_wdt_device(void)
> +{
> +	struct platform_device *gunyah_wdt_dev;
> +	struct device_node *np;
> +
> +	/*
> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> +	 * the case.
> +	 */

Should this also be limited to the platforms which had the particular
version of Gunyah?

> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> +	if (np) {
> +		of_node_put(np);
> +		return 0;
> +	}
> +
> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
> +							 NULL, 0);
> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
> +}
> +
>  static int qcom_smem_probe(struct platform_device *pdev)
>  {
>  	struct smem_header *header;
> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  	if (IS_ERR(smem->socinfo))
>  		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>  
> +	ret = register_gunyah_wdt_device();
> +	if (ret)
> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
> +
>  	return 0;
>  }
>  
>  static void qcom_smem_remove(struct platform_device *pdev)
>  {
> +	/*
> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
> +	 * watchdog device is not unregistered.
> +	 */
> +
>  	platform_device_unregister(__smem->socinfo);
>  
>  	hwspin_lock_free(__smem->hwlock);
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry

