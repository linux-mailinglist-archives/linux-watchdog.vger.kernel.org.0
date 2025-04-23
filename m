Return-Path: <linux-watchdog+bounces-3379-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7669A98B07
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Apr 2025 15:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFBF1B6406A
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Apr 2025 13:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F36F17A31D;
	Wed, 23 Apr 2025 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMs/EHWK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2C288DB
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415039; cv=none; b=MtxMchKz/7moMpK+pq2BVQWQ7kBb9QE6neUl/zifxfMJ1CkhkOeW/xHAV82wLD6b7pcXEBZ7uHDFXOkMv6poXjBPd3lSoOS3XDkRiOXXhJ6+LRpQMK6Kp9bOwgEQUBoCnn59y5fGyTOZa++hSI0TK0X4JKx0xFEY/r+uy9KVS98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415039; c=relaxed/simple;
	bh=WKYV1t5SeWLAIvo4ur1wBfNb7+r/gkkLurn3pxPhYaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIz1kwEnARPba5ar8albjSL2kygQBLEJfm2WM4eoobpWoTPdEEbtsg6DoU60kXqS/kn9uMsPj0/ViXdh7k4HBAd1l7MFg6rk/G8yKypOdQ3in2sxb+sYG9GWqPZEGWP/lblDL3v9dVmpUTkSQ+Px+PcUWSfYL7rhz6oNVEz/dOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMs/EHWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAMlkM016072
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 13:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WbGQoV5TtWkaVGbUVN+WB0tm
	HemlYXyNkVd6UejF+r4=; b=cMs/EHWKfrAVRpO315acQbgZZJrzBxOlSGiIOMx9
	zwT6LIfesMxaap/QlbAfHn9MOEpnI0fRVwmxA4oyMrlws4IWwmii8eJ8i3ioCYtR
	bCdeaFMKpfQhh4Jc2CIWxvAda6zIw7ph9ud54R262WevDmyWjR4Asu9QKasd9UH+
	SdbCiI1VD5rM93gtiGwPgSaIx9azBicbu9aGd1zBPRLqrVmpPKYDx7QCElEmQaWO
	RIOCuQ3F8Bnb8HBTLqNL3juAHUqf5V7GEu0g6MkQqEp17NbnWznTx3FbsX/hBr6f
	gXq5Hrx5qouoGpzNHL6a2llVUK1gikagyits7xD3HpNiWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0a9ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 13:30:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c82c6d72so1112972285a.2
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Apr 2025 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415035; x=1746019835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbGQoV5TtWkaVGbUVN+WB0tmHemlYXyNkVd6UejF+r4=;
        b=cMC0AdriDEj3j4LOQwml14J25Wxa+orFzDmtVjJVoQy0qtJRYVy/sHC4XCPBoRmNuo
         /jJoM09Zn/amdALS6PA9+c79twhIwEQeVdnBZB1uxJ1vlLRKFszJHT3vz/mBObd97R9h
         NSWW5aTZsYFi45MJcVUW3PCm5BRdhFvTLhC9aYFR8uiBrutx/qOUznKStSAojCq4soOp
         q/8Lr06McNQ4Nm9utP4Lt6cX+wGZMsRQzE0UYqsuyAnbDijYz6M4ucNdik08yYevYf5R
         9LPDk7hhJpQbNeu2fNnTUX4WHXx19CRPX1SDdqpktz8PePHFmEhahJ5kcpHmR48zdB70
         QJDg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Re6pr062nIss4wBpIql02L5/L1Gv4/7dTIWHflOHq+xXH86CpnhNAMdExN6T+GEdLmRdG7HQhSzf3wHLHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwswigtOl6P9Pm0m4+slVidF3OzZS9+N83xRDUZ3RcoRIy4JHSo
	z+meJGLEvgs0zeGyEYhoUq1npkCXwC67EGUvjrIZPvoddjzwPkBQ0EBVxID15jkNzQgLFHSiUGf
	IVp7r0cBXSUllXiLgFNqRr8+c/4IUPWcIIXCoUdDXjCGzf1gGOwAT+idUpcP3DDYpzA==
X-Gm-Gg: ASbGnctm986Xqg19nICdLiZmzH95MV95tUxxoQ60kCbp/DgXWu+JwEiiLIPCn15rrTL
	Dyu+oLcrta9Gbbxw/a0TIO2H8IS4xy0oTTId9MpcymfhGVZgwJBvvloB78BulVoiZHM/934Vsmn
	JYczUsGNuckvCBw5650nAERaU8W9P2Gio00iTP8fUKFjP09iFRf+Hks+1t6xdq+Dvj+a+WR7yDq
	GdTVT5naax/X/BDaGEXQPCgJNACXPonoPmx+DijwNAgcFXDa67meXmIOSENvzsrkOWzeA0YnYeC
	FkS9aabWkkMF4vfiiyZQRuzJadC24EjE23XY2htPJ6aamgzbetuCUBNwkLa6FsBccNS+0It3+Rk
	=
X-Received: by 2002:a05:620a:370d:b0:7c5:5670:bd75 with SMTP id af79cd13be357-7c928038eadmr3337063985a.46.1745415034953;
        Wed, 23 Apr 2025 06:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXTfpWsbVAbU0ylBQYL51RHYlyc+81kcBQZEj2nboNhovZTX2+cu6ODjDZ2xy1hvKkUJMoaw==
X-Received: by 2002:a05:620a:370d:b0:7c5:5670:bd75 with SMTP id af79cd13be357-7c928038eadmr3337049985a.46.1745415034096;
        Wed, 23 Apr 2025 06:30:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cf767sm1524502e87.129.2025.04.23.06.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:30:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:30:31 +0300
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
Subject: Re: [PATCH 27/33] soc: qcom: pd-mapper: Add support for SM7150
Message-ID: <wi6azppohttfttjniktjsovstktalut6uhnxiiwekvqtjsw5gu@nstvkc7pv5bs>
References: <20250422213137.80366-1-danila@jiaxyga.com>
 <20250422213137.80366-11-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422213137.80366-11-danila@jiaxyga.com>
X-Proofpoint-GUID: NzOm62XzTke2nBXatabEoZSbxkqFNcNC
X-Proofpoint-ORIG-GUID: NzOm62XzTke2nBXatabEoZSbxkqFNcNC
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808eb7c cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=7ibcVnAUAAAA:8 a=EUspDBNiAAAA:8 a=JQ2_29xaah9frsLSoU4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NCBTYWx0ZWRfX5+n9aLOInu3Y RehiL3DEXVQDPqatTN9dB43PtA+eWw85z0qkNy65uloIaX1p2aLcnX8s1KDvT9RLl4bvOjlgzgQ x1Ut3SC8GW3X6K6zcvv1qcKoYp9P+OIWQoV+Sz5QThkaiGY6ynowGf/zCLOo7N/f5UGXll7cXQQ
 ayiidVrHUxLSUt7prVitgsjviZpzRmujmJSb209KyKeitJq6k0e/HHbtXMhyDX5ajVYSlvuJbzL 6dRyxSSvn00Yclhm9BJa7jGl8Im3dYnCr8XzW1yQ6A+zcUEKLjSAHiA/iG+eoZ/GED32Vfsh11J a85ZMvAk7NQVwzuv/m8wh+5+EzgXJJKKg2N+IXWbcqIz9hZvrdYKDtTW9a4FU8B7B7y1D+Ynre4
 5lKGJ4dNX2NVCrWaz0xYm15u3c+OMH1TBs8zKdwdRGckk8JYCjSd8/VTRgbEHR7Sy4sUbYbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=829 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230094

On Wed, Apr 23, 2025 at 12:31:31AM +0300, Danila Tikhonov wrote:
> From: Jens Reidel <adrian@mainlining.org>
> 
> SM7150 protection domains are the same as SC7180, with the subtle
> difference that SM7150 has a CDSP.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

