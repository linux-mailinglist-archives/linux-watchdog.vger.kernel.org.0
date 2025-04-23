Return-Path: <linux-watchdog+bounces-3380-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267AA98B1C
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Apr 2025 15:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8C716D110
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Apr 2025 13:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E88A195B1A;
	Wed, 23 Apr 2025 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lln9v1Oc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2518B495
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415061; cv=none; b=ozEME3fl1mc+MN+PDTa6RfcmwLtTFnjp/JUKybNtKbkgI1w2rbxdANI+AApvxpGnXitF9RaDB9rlXzuvGXq5U3/ArlpzYHX+QHP6bPuzrGEOYihv9gtXUnj5SRhzPLYf9fLw+XOMpW/vTVyrW9IPLZgefXLiFd10AzQzLqVCWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415061; c=relaxed/simple;
	bh=lPJJwHKGCbJcWTOy/W2KqY1hoahEC6Ch3aeOkRUot7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qV+8BRCfV1m6IYOz+Hd6rPwdpWgKPXYuL9IV2Ow55529x3onlmFx6s1R2xLQ+ipBKMQlk4u17WdFPpUouv25rdIEYwHadNltV28fSRacuTCfZ1ibmjnjXIsGbbLwjL83uI/axMIe/qH5BorHI1uov5v68kh31ZgTGmQHMyZ2cd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lln9v1Oc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAkmuG003191
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 13:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wj+FtiAGAkQ5P/5zChODPkrm
	ZAMKKPl/2U1Ld2vwF7E=; b=lln9v1Oc1wNdBAOcxgSa0NUOSO3GeARiFX0pWfBT
	TB72Ue87DJnryx3NjX+fkfljwpPeSHEttfHNXIMW0hMXfAWmCQz30Qfnr39qHxoj
	Lsz8T5pDCCM45mCE0VL7jq/tReu41HvWK7/F0k9p7WykLE8P6KYjRbdAbVTBQo7A
	RPpPQOoEZPn1+toa5OKpsOVAoTp02EWXjAQ2jnwOR+1nGzmnsNxXz5/jRHpWaMO6
	ZKUigtfJs+ZRGywq+p3Sl08dmcM8y4u+3rlYlzQjQ99zakY39vFtej73yslL+a4i
	J87Hg6K/1RRqiO4kV189DUnc/+QfgYfnPwl/yelkdOc3Ow==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy28cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 13:30:57 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3feba2d5745so1559332b6e.2
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 06:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415056; x=1746019856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj+FtiAGAkQ5P/5zChODPkrmZAMKKPl/2U1Ld2vwF7E=;
        b=FCYAU5GpgetPGOitencLo9jydJK+SZsv92yAB9/MPnjIM2j0TXS6esAQwQJRXFLpyr
         Atlq4aesxmoK2F8B/neNVMflDGLpmaTF/EsDDZxXmr3+uPo+fz/Qg10MiDirDuT3Reii
         CnwydTAl3+8t1X5SD6NxIK80fMJpnL3ulhD3K5pdzZJGDswEK39IprjF3QnDko6qYdT1
         nq+qlOYcgxiB1eHACVISkgKAsiL4Io0uEh8W3z2c6X4F3Olilaw7gWv1RC2meIj5HHoh
         obc7YYvqFpKCJ1xyoevG+X0tlxiRKcGg2vFHN8Hr0fZhY7P488omCPOP8JclqE1b+UJ6
         m79Q==
X-Forwarded-Encrypted: i=1; AJvYcCWN2c9XMyzsFxICtJ4V6aIvxVjeCdvFcFHgmGpZd06/ZKN8ZfrdPmXS5rxo8mgejneU+vQA2HReKJuZ3w+p5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzywfXSgdIQyinBrJA1UK145RPSr4p8X2U1BFocUYsggzQHNAtU
	hb/ObiNWwGIw+14YwUqRFHlXgePzHiTBqLGjXKProxMe8m8ssroutZJyIVQd3o/uHd+jm5OzCuW
	FRkP1HPY3WOXG8HeC1Mvd2ieUAnl8SIW+a+946IJJ+DYg4sTHMTxrV/+xONeE5IW9+w==
X-Gm-Gg: ASbGncsoQMmGT3SUUCgu3Ti0I14IMY/D5iiLMG+6TusfkKYooKyYmQUYlFuG9K5b9ti
	oh0xiPXeqcC79TkmxGLp8tGuaaKieH/ccWOC3A709Z2hITVvbSHuvjm0QGBYCtnd6Juo7qpUmRV
	FeSPNdeFfpvPghit/9aeIqGT8SH1LZlJXlsZckm3poVmIjkQBFcfopjDHsW1vYwW7ijCq5loiAs
	66M6LYc4164ObMa+nfa2AlixC9OWLG5H1EVPUDQ4ToSQVJCX28zX+zZwuk52fmCSI9NInuXnw8G
	8NBc7+0BO4q1LDcHugeW60rvjyxOBhup7NHWi+Pz/PvMO3e+JL9cJ2xQpb5CfQCyfI8W+C5QoXc
	=
X-Received: by 2002:a05:6808:6a84:b0:400:fa6b:5dfb with SMTP id 5614622812f47-401c0ca677amr12197826b6e.36.1745415056335;
        Wed, 23 Apr 2025 06:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDEi3rdB2ep6R+cK4PHyu/fZwFAeRdF3OHYastR6zA3OEKUX6hMlxowo/Y01S4Kl8W7OZkVg==
X-Received: by 2002:a05:6808:6a84:b0:400:fa6b:5dfb with SMTP id 5614622812f47-401c0ca677amr12197723b6e.36.1745415055890;
        Wed, 23 Apr 2025 06:30:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084e434sm18283881fa.104.2025.04.23.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:30:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        David Wronek <david@mainlining.org>,
        Jens Reidel <adrian@mainlining.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-remoteproc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 28/33] cpufreq: Add SM7150 to cpufreq-dt-platdev blocklist
Message-ID: <pywgehih5yrxbnzyjtufkh52xiuonsjv7wougvbauiw2yd3mpy@imcguzi5f7fm>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-12-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-12-danila@jiaxyga.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX5TBV4dKGtnK2 tSW2p2vCmSZqbXKHHY4DGnEsL42Mio2mFypA9FnYnNNv4bXjR6Z0mp1yl+Z7z3bsnG4V9tRTm9+ sS8o7Tp7Xs+BbG1J8gEB42DNs6BeqR58JFGYHnOgFhTJIGJdyfM6bVoIy95qX+HUYKvVEhTvrJi
 +kHFaErUOecvBpdMmviQc2IDLe4DLuZRL0I3itZxV9PxgR5XbUUnsyzOFcJ1wAuXcqHxjhylww0 w32K9gKp72mkbPvGDtQIOqYonkqffkC2tjAu2bBWYVRc8uO+B/iJsInmno5roXNWJW2cQSWARsU 3ZH/Apj1pWjHdrqknnoLCY7sdmDEBSLk5B/E2weYx0mExvE0Z7xT8buYqmhgu1P5AptQi1obE/7
 odXhPMJG8hB8BjB+4XgrDnTYaZmDdKt9z225Juxu52aVQOUPDM49tKDHcdF3tXSWffnYWpGy
X-Proofpoint-GUID: VgXUeVIO_GPd9abSp__vsv0SDXQ1N3QD
X-Proofpoint-ORIG-GUID: VgXUeVIO_GPd9abSp__vsv0SDXQ1N3QD
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808eb91 cx=c_pps a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=7ibcVnAUAAAA:8 a=EUspDBNiAAAA:8 a=KMkCwTOw-m2sBZ1LepcA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=624 malwarescore=0 impostorscore=0 clxscore=1011
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 12:31:32AM +0300, Danila Tikhonov wrote:
> The Qualcomm SM7150 platform uses the qcom-cpufreq-hw driver, so add
> it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

