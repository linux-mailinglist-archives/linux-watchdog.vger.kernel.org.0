Return-Path: <linux-watchdog+bounces-4615-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD2C695B5
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 13:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD3794E44BA
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 12:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158C0315D3B;
	Tue, 18 Nov 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRCQGFlJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XX1elc67"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D099306B02
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468682; cv=none; b=Qj3Xkgqg7QBkEKCaIJrR6/KQuAYv6SONiz/FIV7ITQNWrDXontXBsj1bqD4DpO4fIfD7DSbjErX8wIJSKjgRxw298Sic0XYMtePyvreuM6XvH1a35+ajmVSRv8haQ5prVW9roZ101nZb4szgv95M0BXggbS4iS+UnU3nLlcb8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468682; c=relaxed/simple;
	bh=huYe93wRFMhFP9jgygcl+YFgbFfEk20gLV/A0igsqJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaDDRCY4gEfwXQfbUm7kKynfwTuJ1N1EqcxBYig2yYa9mLWCD3ON7b/0Saa1qHjpa+Mi7zxxhhf+cl2jnWhMZS7QKEQ3nnpwWpBhblGCUBwbyz59o684yT9Q03tqytO6cJkUW1WtCsPcALf3qt9+HmZQ9o1EfkvC0xez3RnuP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRCQGFlJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XX1elc67; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAW7JL027447
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 12:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g07JOyEzM0TjbD6ezjDR6ELM
	vtt9Jl4vE+WZmWAkXx8=; b=JRCQGFlJxeDmZ8n+ySQ08IF24yMp5qsq/Jg0szEY
	bwuoVpUjqxPfjh0frtIJNatHQiyZpmKF3YeoNNIdwx2Ga+ERICkmSXFeYysnLlVs
	t0C9NGD5XPjeYBjCqZclrw81tljRTmZuwcXDdbzMxn09dEHrk4QYUcwPCh1R/N3R
	tx8LLRnl4TokvVSFkWdr4+PHddBuM4e448B9RXojGr8A2cw4rubVHToUp9ANBwVV
	yE8O74BXh4arddmrE/JTUJj+r41NaTmUARlhTKRZ2NUDIONrdzqeJFtEMhAn61uQ
	MJDM2mLYyFoZY4v3kASQNvXO+0ylkAT4WTz7sDfeMf8dWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t321k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 12:24:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee04db384eso105520631cf.3
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763468679; x=1764073479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g07JOyEzM0TjbD6ezjDR6ELMvtt9Jl4vE+WZmWAkXx8=;
        b=XX1elc67tqZ3bCRjtzXxKmScNT1ml4QoVafvpg1wEG8D6kIQMiOGyPNAeb9hQScnBE
         tnGTw7fWDYl6vN61PiQZ4MXcMJ4t8jDFEEzs9Od9lGTnQjyF4VS86TVmKxbxCiephvxK
         LBh8qo8/qcP/yRg7TrOPS9ipLGfyKxKOtdgk0mVZQNFAKyIsCalHWGMNHD3FPneIbOdX
         pijSP9gpYBFaNvRuIOmGR/8HKboCnB291T5Se+jtmZxMC1ds1a/Q+ijy7e3A2y5JQc4O
         oe7rPI8GkITtxBFf0KA5s3kmmpllkyR9bnxl2WWumwTKqe5GalIyZddL23FSqPOINz/1
         WOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468679; x=1764073479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g07JOyEzM0TjbD6ezjDR6ELMvtt9Jl4vE+WZmWAkXx8=;
        b=VN1TpShp1UYog5HrZGWSvORvuQyJDCi5Karx/OI76QeKS8qlptqJhp3JE1f9O3U3qN
         xTXNpyVi6Ai32gnP4iZraKuJimb7jaFC/3C0D1ZJVPNv4aLHXTFakAvFJE3Jsm4U3MYn
         lGM2iK37VFymaAcvRa+mtCSSRhoqc9hVshWnhJtAJ2eRojtTqB17ISl4/kyzMPM+KS/u
         ddvo5/HqIMQHw1t31HzvMF5dSeX/zfCk+wJXJcQF3jfRBwCGsgV9njreAhQWcGPhQILu
         Qntf/v2LJIQ7Ou6CX/p5pShRJDIj4kQZHBe++vBeasKk0v8oUwRi7dZ/vRQ026OqlHpZ
         SQVw==
X-Forwarded-Encrypted: i=1; AJvYcCWovdG31cdNVXtJh0GXJK2AsfDfOAyeYo10PvQfl/Ou5IWRV/HKBxiHoW19Mt5uRHOLG/rZCAJpAO4haeZ+lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQ21P6XJaxU9nHjoYyKb7jj5iFNDsrEZu7cB/M6MAe2Lb5JDa
	UvVh5NN0sC0WZml5DN1ncsbQSU9zN3tNsVI9sZR44pgg4GPK/Ub+d61uqr3EajUWTB7GcdBJavb
	lHafg+TFLfH9u+ZON7SYzF1V1b+mHBy7EZlWYQfAq3BVQKFaOyhr4TKD7/SBj158uU71Fgg==
X-Gm-Gg: ASbGnct7vTuVlmcTb48SEBHOln7onuSwjaZj39yWsIFdU2khblQfGo+vq7GZjGo5O2V
	zMQCUfiq8+aHn1fQPYCTu1zDsOKXzRhtLnJPqryqVCD054ZXoZGhcsf+3JmgqGU+q6520HDfKEg
	FIfWL1+rko09rd+hjgIcONJZv3/ekiUy/fUl5qnmJR1EF17/iIdpvg4urqDX7B6yB8BEjBPXfSV
	Yhpv2UHJxgdO9vOa9V8Xw9Fv6K5r/wPQiz9UQgmDdBd6Q9FUyReKSv79NrEHah77r9BZLMCuM15
	7CpS2z06yWanHrXo0GrWScw+UrS9cGDtVTBJMQs6vhQ+tgY3mwDrIzYQm+wwGj9Sj0fgbsnfr9Z
	7sCAfJgz23lLyze8rrib8K2zdNxL1SZq4gGQDq5AI1wbVaDRK9K0Tmf5mTPO4s85uoFyEA6ElMZ
	GFZJ0Zi4idbj3k
X-Received: by 2002:a05:622a:355:b0:4ed:6cd3:7d1e with SMTP id d75a77b69052e-4edf2048792mr210596401cf.10.1763468678652;
        Tue, 18 Nov 2025 04:24:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfdjo3aY1W8lhHj4V4igEYF/+oA7pGr8Ds5Ftpg3JovJEBSKb6NxOTd1Ty9fMH9pPAF6NYcg==
X-Received: by 2002:a05:622a:355:b0:4ed:6cd3:7d1e with SMTP id d75a77b69052e-4edf2048792mr210596091cf.10.1763468678281;
        Tue, 18 Nov 2025 04:24:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37bccabf576sm1512771fa.34.2025.11.18.04.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:24:37 -0800 (PST)
Date: Tue, 18 Nov 2025 14:24:35 +0200
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <as2u55ojagrz7dpm6ueg2x2o7e2jhvjcm5gjfuyoguniznnzqu@gieinkz4phfx>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <20251118-gunyah_watchdog-v8-2-e5de12e2eef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-gunyah_watchdog-v8-2-e5de12e2eef5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5OSBTYWx0ZWRfXzhyNwuwqDy12
 MtzdoM4fZ6V/zlwBklLYdhMTWcTGd2TuNmiWp9Em2GAhQ/LeMTMyZJITVF/M4EJoYq4fIvZCx4z
 6J7HWF4B8jZdLdjJui0rlKo3kyqiVWGBBDsGwvvyBxwOmE70NwQKolj2V8O8iFreb+aNezSQTy5
 shOP/zKhMne0Sv2q9WdYen5PQlzZ0iMVVPCt4ok1zChTeL9/3Y4w7QKZNYrG/Va4noMuM8yIxzo
 /dBVoocMhyWHdobNFgfxKYFnubrFJMGs2AKEBf7dmpVc5QXle1v20FopbW7Ircmf3dBmWBKIJqV
 VpEzL7bk5WU9WjW6joXK/jnshrMz+R8KNHr4CbjvBRY3CJHJ9SWs3liAo+XC5p+AIZFo79gidZP
 kB4+o3QWijYJLD9vrpQlH/F9R8F1Mg==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c6587 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=qi9a3yEbpvmg9l7mAUAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7TC8zuy7Hf8pfyt8wswi9mX7NppOtZ3m
X-Proofpoint-GUID: 7TC8zuy7Hf8pfyt8wswi9mX7NppOtZ3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180099

On Tue, Nov 18, 2025 at 10:40:57AM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
> through MMIO is not available on all platforms. Depending on the
> hypervisor configuration, the watchdog is either fully emulated or
> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
> Specific Hypervisor Service Calls space.
> 
> Add driver to support the SMC-based watchdog provided by the Gunyah
> Hypervisor. Device registration is done in the QCOM SCM driver after
> checks to restrict the watchdog initialization to Qualcomm devices
> running under Gunyah.
> 
> Gunyah watchdog is not a hardware but an SMC-based vendor-specific
> hypervisor interface provided by the Gunyah hypervisor. The design
> involving QCOM SCM driver for registering the platform device has been
> devised to avoid adding non-hardware nodes to devicetree.
> 
> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/watchdog/Kconfig      |  13 +++
>  drivers/watchdog/Makefile     |   1 +
>  drivers/watchdog/gunyah_wdt.c | 261 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 276 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

