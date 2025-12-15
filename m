Return-Path: <linux-watchdog+bounces-4704-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8CDCBFD75
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Dec 2025 21:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18C00301B5D3
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Dec 2025 20:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1E8327C13;
	Mon, 15 Dec 2025 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5YPUuW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imgyVjQJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA213277B1
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 20:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765832033; cv=none; b=DIRtgxy2ZJvLYkpafOMihL2o8lG5bdnyIZB71zZpVAar4xhnYsE/9wfG0JOiwbo8Md90cC2VW/BgQ/PXQ4V3iZTexHRPogb6djzkcwK5A9CDtO8n7M0UiRCjSlqhAIwugdXwOsk1C67Yh1GkOfBhlMiJhYwC7KicOwnhrpW/4ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765832033; c=relaxed/simple;
	bh=QKfdTtB9jsJqpAbAZPYl/K+4Ds/KScd3T1DNwwUd2pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StBrgcB3KyYeksauFi/ea/k2yxu89ynoSpkfFEe+H0GnSgwbkCRStpF74PkaVhG8zH2aYlEkE8DR+Bj/b5LCZQLskX7WMHwm4kzBdHK4bo3Y7Rkl63flhlSt1+x/BZgKTBGoMdnlmeuNlCydNqeYS7xWDnk2lXKHtbKOWqwNYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5YPUuW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imgyVjQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFFraEJ825867
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 20:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T/TsyWJzD5iXI53eher+jj91
	fa49Bf82Hz1fklQl6wE=; b=A5YPUuW/HQT5YkbWP0p6vSMTHbU80jsm+XXFj0sX
	NfrRYS5Ocr3MrUB/sSZ1XmsxxhMOhpBk2FN5+xfgPJrGukpdeEbCxoK4XOqU9Kjz
	lqZ5G2/CMHIK+pQ691LBLMMJmg1+cOHDwKQMuKwq9QqYOjK/0fvdx9Hx76nn+pML
	Y05JsCdGvrcJBxD1SX1bbKb0REL7wJeot4ZWDjRTn22Opte2lHUC8V74ayanTgcT
	ChY0XQz1SGqveGjYXa5wRryqfAmLWxqFm/LTCZ7VY8muxgKgNJIaHmbnc5Clkn3a
	YLZXD+VUdN7YVLV5cJRZcrxdS5pBQLJzpIWJljRvhNJbeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2nceruq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 20:53:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1dea13d34so57112091cf.1
        for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 12:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765832031; x=1766436831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/TsyWJzD5iXI53eher+jj91fa49Bf82Hz1fklQl6wE=;
        b=imgyVjQJFFdxEy7dcnhoDBc0Fm/vpRoVG1WnTjk+yqAcOGCl89DtQVfA38cZBuvsEn
         Wxb9UTl5d+DRYps6uibNYjvi6kgH19osJdVMq+7LwcPtKRg7W8EI4uDourtxIIKpycZE
         ydxT0qDavAlRdlBXZte+GmV219iO22LHW3i9MyL8SiLA+lAe9yV6VS5Dwj7WO1mCQbib
         ZiXVLsgzCa42HFz9HSW9JRQE6M7WOP3FzhtD4gAIe19PVAXcz+/7oODFCZohR6DyY9Rq
         ehrcKv0fxRDb7eN1zpc/6na444JBMTmuinSn7KASMtQTGH+l26RtBpu0g+kkA7FOdBlx
         Ec7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765832031; x=1766436831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/TsyWJzD5iXI53eher+jj91fa49Bf82Hz1fklQl6wE=;
        b=bXlE264KbNhSutoJfGL4J+iCrx7vufS3HqdDScEprODjDQUFCtYayYTlluYSCfFU+W
         vb0yoTXcZAoteKgsFVKy9SYzbhHLbxqji1ttsHGyGLLxrG6y2S0S280VywQGrqhSPpzl
         M0ZSz6Ucqf09TPGxk3QGtxXgBxrQD10xnuaZma7/YN3SKG/bS/kR5eYvPRdaakYMObUE
         pzKmkWabZl2+KreGF2DiNQr5qXuCDxavoTh2J4m2ZGmvj2RC5wEngFiZSA0UlCJ6mgGS
         hBgBLwEkkHB4tMAqdaagNZL5pqLITxwPsiN3VbBgKvU+TcfrBCnQqXOdHXtqlTktqihD
         NEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVnOf2oAJKDwsXa/2ZHyJP8SepnYLl04RLOz0mvLqTS6tdHDp9aI1yVtZ2ROER084Ab80vSasJ6jkkpLBr1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPvDI7peOIKs7t7M7fh59u5eSRmpKRS4xwsTJ2LGMtOJZW8np
	wxzk8ngBdii/52KbxeYJVlFBt3Q6eH3XdzoLvNmrEBtSbOmVBXUWdqE4Mpy8pHRyUBu2E2AhT7r
	r4jvyoVuFV4InEuZ24XwPTB9ZBDY943gb2xWPaPbNFWpfrzUTCr70qfjbhMLgybVOQgSGcQ==
X-Gm-Gg: AY/fxX5ASiCOnoG2/do698LbsXK9nFpEQQfi+9WAk9hnODfKvEs8LBanDtjqC2BKMg/
	CYqBLpf2Mm7Z1E8HZqJeZcVcOy+ZOCvJXnsmxoibrHann1czIQ7ngRIe2NP6idGSp8/dRauVAUv
	sHDAYp7IpXBa8eGdurx3n9le9GfIxYQ0b0oQvAdwSZJsQqpo44GL+ZN2CKcWkikztCWxSQ3IOV2
	RGJvpddutsb3YoINcJ7BjUk6KHOjSkSGrvtjlM7NWFgFdYki1svntsHVgIOG7FXTNBj9eLvfy8l
	0phx4zTLogO+5fVdA7mXdCItSDj8XD2/nCeDtA322WXa5mlzs1pkHjlwKtclflM3g9uXaitW8Fr
	tLPcebTcYcXdQ/48erBiZdtnu7BMSOqNjRRCxxqXw2KNlLnT/vu1s73Sv2A0MFhlQOIgatJ7d55
	2mQTT/5EQfyUk1X8WhAg+G5es=
X-Received: by 2002:a05:622a:180b:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4f1d04a5965mr142206791cf.15.1765832030686;
        Mon, 15 Dec 2025 12:53:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUNA4qOYmANAfvN6yXIfWAwa4vMNCBaoGyJr5ijB7DJd+cJVTwWlugyRk84pW6j9Q4YgQ5tw==
X-Received: by 2002:a05:622a:180b:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4f1d04a5965mr142206561cf.15.1765832030259;
        Mon, 15 Dec 2025 12:53:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a743sm139507e87.41.2025.12.15.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:53:49 -0800 (PST)
Date: Mon, 15 Dec 2025 22:53:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-el2: Add the APSS watchdog
Message-ID: <wqhgxpijztpnsxhmh7ed4xmrn3bypvyflcry2t5pawbyoca4dd@pn5gh7gh27pe>
References: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
 <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xczizRxRCbz5cUvvseErAPVfdK2hfTpe
X-Proofpoint-GUID: xczizRxRCbz5cUvvseErAPVfdK2hfTpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE4MCBTYWx0ZWRfXwpyUUJr7F9gR
 G9M+sGtQcHgDI/2vKgeuUqkKVy7EC+A85YkCg5DBOTKkKhRYMXwlCLm5LgA0hrxvSwKevzzn4Ha
 46W0RRmg7t9+ylxINueq+GyPoP7e9Q2LyRUCNXAJhIZ8lkbE0CEGUC7Insy/AlQnq1jvlj3PYE6
 PzdDexwuLJKM/eGMC2rBZ+sMTp4KRkTPnpr++6gKJdqGw3I50RUuni26DrWdQahvEwQGgmDBXBq
 ykkBvcjUw+m2zX+2FC2xE3zJkTl3RBiiCsn/c9EbwqAlmMeLbrTEkNP9dJNhxGch2HBKcLQEc4v
 VSAZw+LpOf29qkreu3HH6Kb7zq0hm4wyBOiDusUPduDn5QX21rSNuKL+iWo9bBaVaOP4XNTb0Rt
 jHZ7pD/1vkJPLotnvC+ZzlZ6QtCmNg==
X-Authority-Analysis: v=2.4 cv=XJU9iAhE c=1 sm=1 tr=0 ts=6940755f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SdC5Sa7j1MJPWwsnmbEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150180

On Sun, Dec 14, 2025 at 10:49:59PM +0200, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node in the EL2
> overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

