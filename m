Return-Path: <linux-watchdog+bounces-4193-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C581FB443E1
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 19:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85A5616EFCA
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 17:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A66628153D;
	Thu,  4 Sep 2025 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DElUdKsm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C241F91C7
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005567; cv=none; b=XlEtNCmeHG/lyFU6FE8ZRS/0Yama0Il9VFMVQon70OOEatADelTeS7VYrYxl3jzgc+yCKD4DwQ7w0Oq/UwjmG5jkafyGTdATCr6VyevSYxPR5Ue8EmwgMu+j8cU0aMPjoz2DJR+Z1fpCeIlSZTi3NTBM+Cp/Frgi1l1+x1teJTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005567; c=relaxed/simple;
	bh=kex9c5ksWfEy4HCkCcEs7BW59/eVjTYWD+ai1fAWMMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7XDehLZ/TNEYi5cSREL69hA81XjTBRaWEnle3lq7CPqkFiuZJiRmJMRSsVyE2IIl3AavyhbLvSvnn4ZyyJIU0DXnFHR0hEwMAh6mGCkYRCvWcP949nNxxXYmMjsaEMyPU/oSV/tvJfQDOY3kG5uOPogW1lOv9Ekcijqui+AVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DElUdKsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XH0t022433
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 17:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3TzY0hMaxnKfqA1+sr6FktM0
	GXuI/kkBpqMcqTX1ICw=; b=DElUdKsmHvnopTMyaZF3Di+MG2ZJ4rZMh1DSoVVL
	sP4nkXD6wVBujv8ed0Ov8YPMOpf3/Rzj/MbsbDRdfQrkVhO4EeD4UNyhT7j8JZrL
	BYamhpU98BRZqL2uYMoJyazUwD6lb2zcqpHqXRu6bCeBUDYJEfmGqaPDn8HXVKTN
	JdURNvl/qezicwLXXxbTuczXMj1uYVqbw1uRk+bJfFjfTzaFZaUvTQGVDDrU5pmP
	SYRe+5nTutwPbr3B7+14ADvFI34GkbaqzUDP7ZvhFKXFJGNquibQJ4+ExuCHNvxe
	7vQUCe23lhY3muyTM9tvrDYBj504fHQt53gqVpCDuOwhFQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk984m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 17:06:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471757d82fso887669a12.3
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 10:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005564; x=1757610364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TzY0hMaxnKfqA1+sr6FktM0GXuI/kkBpqMcqTX1ICw=;
        b=aly/CZSzDrI6NBOIfE7AsIpS/qgSAuUkuHim/RevnE6TCeF4GSHJm9sfo/+V791L3g
         fDvj6TmOkXBNtMhcgncgKvgftDxc1iGvViCNivHMIuUqUDGE36SivGyQXR5+k12Dlqjr
         Jsy4hnXd57CSAg8KOZmNWM1Knxn1Rq955gA/1xn5X4w3GyVwWjr+sZGBp73GyymE40UM
         mI9vLSoy4xCMogNrDHCytOIhOVHyG2v2jfC5Qf4dWStLGmkYwpWhl8rwTVASOxyKk7pw
         AcRQIMmEocA3A3Rk6+JTuRTwD6wLT9MmPfG6crBEUwitYeZUMoN2RfxbgigwgiYrsgHD
         m1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeMw6kD3VLymKN563CoC8k1UBl25qReV/LyBnfaeV234jtm9kQ5SliSkwkY2fiklVaWCBXKOwsRSfXrqfWoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaM3wu7oql9vcll1aM8n/ihBPYIHcbBlNSCEiUJRXX4cuMTC95
	oGSL3wG3ynv5X9UPLvon3/gOVGgTnlwY4u+KFPoGnj+OtorPUFCIvkjpOy/6ZYa0eNY0qrGgHIU
	+o3E8CVoImA7bHNcYK47waWe7B6hzUtHJD2nE6B3ls0w1gtsHtt1HK/mg/sYOiy6IMyEL/w==
X-Gm-Gg: ASbGncsjG7iSdZ0QU9AmHiPC7AIcfaxcBtJiyVu/TtGMsJ/2UqbtX5ZOxzZdH5K9+aL
	xQpzUv9yw8HaP+XOFChzW/a7RX/LR87pFftL6WLV8V4EzolR+maI65RNDkbXlTjGQssscuC+ijK
	xZMOumF+/xSmmddxfnlbCzi/HZVFft/677HQ7uC4gjuFhyFZKZaJpg1g0JUmFNI/vzjfX+dwlbC
	e48GD3ng8BXEipEgkGj0R/gJgzTjntMdfVlTDWlb4dtJK/pP6N652MnROhTSFWVT+N3i8iIqr2i
	isc+MlxtFk7ZwDM/rag4eor8XxqxcYe4+ZZVlh1ti24wu7eF8KgwR/9pcW9UTlbLZIVAwBju2w=
	=
X-Received: by 2002:a05:6a20:5493:b0:243:d1bd:fbc9 with SMTP id adf61e73a8af0-243d6f7ef68mr28359329637.56.1757005564001;
        Thu, 04 Sep 2025 10:06:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjvSHSjScVhR0qGM4Bgt7y43u2+FjqX3ZFKJAbEdvUCzRzNDRc6FFqe8gLPFasv7ahFh/NAw==
X-Received: by 2002:a05:6a20:5493:b0:243:d1bd:fbc9 with SMTP id adf61e73a8af0-243d6f7ef68mr28359260637.56.1757005563354;
        Thu, 04 Sep 2025 10:06:03 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm17564167b3a.67.2025.09.04.10.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 10:06:03 -0700 (PDT)
Date: Thu, 4 Sep 2025 22:35:57 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <a3af076b-ca0b-4d5e-8294-2bf5a9814959@linaro.org>
 <ec0dc13a-30f7-44a0-9a4a-5f44eccd3933@quicinc.com>
 <qd22epqcu7sdza6jrl3tj7pceohqh3clsywv44uau5bvszux54@ajqseswmwf6x>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qd22epqcu7sdza6jrl3tj7pceohqh3clsywv44uau5bvszux54@ajqseswmwf6x>
X-Proofpoint-GUID: TX8pzXe_OzziSLWlrjNpU_up7l_m9HGm
X-Proofpoint-ORIG-GUID: TX8pzXe_OzziSLWlrjNpU_up7l_m9HGm
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b9c6fd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=GWRR-jdfUFecq8Rc7ecA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXwOshYuRGgacq
 4HHF9fF6li2bxf7od2tl57dpmbxWJ1b36h84705EYeo5F2/Wv1ovg0hlcryTKOxy5Z7c8Alx+K6
 WfWyNPn37EhCaeXAs9f7DDnh7udO6OxdrjP/cQEJGTCs7GgZEyzrlj7g7Q79NykCwIsIFe93Kbm
 atvqpoiPjoT2fW+bJ1nhWmaa1xO2QpBXtqy/ng3X/6Tib4keu3y1lVasXwelJ6s/MP9t77y8Q2f
 xL7bXkXxxcz28rzSadnZ6pQSVq0jNkwGly9MMj+nCwXBhkBjAeXlucDjQF7khu2TRrXbiOej0gC
 8hLNeBwjB1PnEhVGp5WxKYQMpks9kZcfQmR+L4cid5WhCGTheVHlEqteuRU44jk8L86sWw1u6TP
 dZyOKTex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Thu, Sep 04, 2025 at 08:53:14AM -0500, Bjorn Andersson wrote:
> On Thu, Sep 04, 2025 at 02:48:03PM +0530, Pavan Kondeti wrote:
> > On Thu, Sep 04, 2025 at 09:13:23AM +0200, Neil Armstrong wrote:
> > > On 03/09/2025 21:33, Hrishabh Rajput via B4 Relay wrote:
> > > > Gunyah is a Type-I hypervisor which was introduced in the patch series
> > > > [1]. It is an open source hypervisor. The source repo is available at
> > > > [2].
> > > > 
> > > > The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> > > > access the MMIO watchdog. It either provides the fully emulated MMIO
> > > > based watchdog interface or the SMC-based watchdog interface depending
> > > > on the hypervisor configuration.
> > > > The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> > > > version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> > > > 
> > > > This patch series adds support for the SMC-based watchdog interface
> > > > provided by the Gunyah Hypervisor. The driver supports start/stop
> > > > operations, timeout and pretimeout configuration, pretimeout interrupt
> > > > handling and system restart via watchdog.
> > > > 
> > > > This series is tested on SM8750 platform.
> > > 
> > > Would this driver work on older platforms like SM8550 & SM8650 ?
> > > 
> > 
> > This driver should work on 8550 and 8650 too as long as the hypervisor
> > overlay is applied to the device tree which happens in the bootloader.
> > 
> 
> You have easy access to 8550 and 8650 MTP/QRD devices, please give us a
> definitive answer.
> 

Thanks for asking this question. I believe the overlay part needs some
discussion here.

I have tried this series on 8550 MTP. The overlay failed, so watchdog
device did not probe. same is the case with 8750 too. It works only
after applying this patch. I will test and report my observation on 8650
later.

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb5..b200e8faa6df 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+DTC_FLAGS := -@
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 
 apq8016-sbc-usb-host-dtbs	:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index eac8de4005d8..7536b1a4ec97 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -328,7 +328,7 @@ cluster_sleep_1: cluster-sleep-1 {
 	};
 
 	firmware {
-		scm: scm {
+		scm: qcom_scm {
 			compatible = "qcom,scm-sm8550", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
@@ -4855,6 +4855,9 @@ compute-cb@8 {
 				};
 			};
 		};
+
+		qcom_tzlog: tz-log {
+		};
 	};
 
 	thermal-zones {
@@ -5913,7 +5916,7 @@ trip-point2 {
 		};
 	};
 
-	timer {
+	arch_timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,


Thanks,
Pavan

