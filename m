Return-Path: <linux-watchdog+bounces-4737-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D33CCDC31F
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 13:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 893183024E4E
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 12:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF317331227;
	Wed, 24 Dec 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auxYJsiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObJWw9y2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3431AA9F
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579023; cv=none; b=tvMrlFM1r+HUHzOK6rJyTDPLluv3rDZUuOaBzEFzHB3ETsc5NCBX7R9rTtHJ5PSyhttP2dxGis03bZPL+wQn0pI3xNc/qWygG6j6foQgRHPswsH0uTKB7YBKrIrydsSNAtuWvvSPRpXt1xPhnGqOHB0Oq2Ao3o2DG5mDL5PcVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579023; c=relaxed/simple;
	bh=upAEC0z9eOTtdXbTQXxcwJheFZpgb3MgDZB4XXR5iKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoiyhN4mVuQtnmngRA44v5tbfOgRIbKYo9C1sh4Be3nioyGFi0w9CwMmVqhlFalHiErEmRrY3smKV8KHZsUcWVDTRbt2lu6ag3x9I9NTZsQzIJxI3JolF0wxtk18ezSLIZIdw6UrrSHyb1UzKIgAF8jkJcwld0KUjho5Ax5hEDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auxYJsiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObJWw9y2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9h1OG1561938
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 12:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q3XBoaOzyi2mpwpKKObIZOpC
	k16mU1PQ4Fx/B1pjtdc=; b=auxYJsiRSvFTiaBlY+PY151cWUSsZAIbg4LWwaQ8
	ngeqrqshksq+30ZkmMOY4Hoa2PL/mhudBfTN/aN2wf3gtnFlVkPYkqd3QWUjDhUw
	WtS9Dg8fY31fo8Npt9KKc71lYaMjVbz+5/FXhBcqnOXkBYo1YHyRtYKJ1erSA3ft
	e3oYIvymUVl2xoGGDcmzl83j8EOlhGfn0x2EdfjKYfSU4Ai207EWhmor26jy/W2G
	5f2n1BC054l+WeCf+vvEMdvnvV4GLRG2WW1Pw14GXSvZgKPk07Blut8Bw7jaPrDa
	xB7xszbm6Hu2XOvg5yAae7mPIfYftFO8HEGw77zVhpXLzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu5ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 12:23:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a316ede50so113887486d6.0
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 04:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579020; x=1767183820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3XBoaOzyi2mpwpKKObIZOpCk16mU1PQ4Fx/B1pjtdc=;
        b=ObJWw9y2mBFpAxo+CCQAe1homJLLR7ced3cukS7QIyoHA6Gefkegj73qwykWtalTQt
         dipApCfobUN+5tnHFU1HnT5Lpu8qIcf2OY+kRVWP0BZsy4SZz7hMUUXVH7EucfFXOnBk
         UelsfvPTFE9Zf3DbLJbaz0TJTonMHHiV0z25kU9jIKxPACRuYq/WvicqK1c9QgcE+CBI
         qDG+4VEITHhbltxYg7J2gsNt3E8Dqo3BsctKYon1I2e5FcrAZP35gPAORN29m4gINsE2
         wtI6SOtTfTb6uzOyCz708BFaBJ8bXsKLAlU22D7zK397TLnF9dp3q12Aqj/Eiu3AUzk6
         YwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579020; x=1767183820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3XBoaOzyi2mpwpKKObIZOpCk16mU1PQ4Fx/B1pjtdc=;
        b=JLQrPxnVz+MmrqrknMuDe+VBETVCsfWW4sD9QE7ERsMx1wRaJf3h0XykTDiCvnhso0
         3o/EszzNg5mLbgpCHEjI2yFXKGDibX2H6rkBT/KKdFvB5kIPc2pl3Py6W+a8zdtPJMOa
         vFs1VJhRwY8UEcUmyX+d9tUYpRCl8qIQmEwX7ofhg5ZVHnTLuE/mkhSWMs4PgaHy9SGI
         msT9m4zy/eblUdtjprr42erzEKZwYHat69CSwMMXUsCE0B6OzFYfOlIR/ltrLRmdLO5f
         z0qG2vxumjRlbOurSQ79N2AGF/9Rx3Bp5ED4IAPCD2NFB2WEeC0iLodlx7FCqGTJF9Bt
         T7/A==
X-Forwarded-Encrypted: i=1; AJvYcCXDvNa8v80WHnk5mvUYeKuROFqjWf36tGyI97dqnPQlnGPKU4J+aqqkvVzRba4OWPAMLVozV67/ic/cQGPLvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKpSXcZpa85Wu07tu4kpgCoCKqm/REHajXQXzEt0yVm5vLycZ
	0HoPvH0JKbq84rUm45oFBYIbHk2IlSCkvH1dwLgj1kqtpHSAFjgw3BV8i0rUng5PQU2/Oy0X+nj
	z5WpjE98FX6+cTo/aXnCoLptocT3jhkONjjfD3BqqJYUUa4jo8C+W/KPNMnV4h2g0S3B0xA==
X-Gm-Gg: AY/fxX7mJz+DdjIvP10joUpwY4eH4NDK+4tMhgIINQ1NZ0o5r3gpeF9Uc/3SYyg4Qn6
	01KqFrfTVGYyG883RPEaTCFcCqddpjKdB7UZ6ph4rcjgKcwLT3w5snRSohW2ZrbwVnCg353gPDs
	LQeAh35z4xEf2X0Xu2c4Rir1x9BfGxNvHzugo4bwNJn7pNkAa4kphuDMlfYCEdkFIIVdBb5upgQ
	rujR/k/Bbmy7aRfDcrCfb1W8Iw388zwsAac/EcLrfDBo+EsIHJEB/AkR1REE5GM3BX4MNrZHad0
	QbbteHyvQ6gmA79Gjia0HtWAeti64gFIZp4RlTZqjF+WUozv/IepHUQSVWzDnTRyC1NsI3u/zsO
	0ksnlPmK3PNXFEQMDHKr+gqu+MK2ESTMZ1+oWUuZFdlcXNxnI9HHTn8ecsrjWmOJkH5/t7R8c+p
	E6Pfm4zj1jYi265NyCJivVIlc=
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr320279826d6.35.1766579020379;
        Wed, 24 Dec 2025 04:23:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGh0XS144YHN0KqGLh6kbJ62tw+ca4eNND0XVbMUMIkHFtTbkRRfwuu32QAZyuHdcnFOuCog==
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr320279326d6.35.1766579019913;
        Wed, 24 Dec 2025 04:23:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ddd39sm4857503e87.42.2025.12.24.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:23:39 -0800 (PST)
Date: Wed, 24 Dec 2025 14:23:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
Message-ID: <doohnt42hdq6oxw527b23ycnbb42l4srbkhuejhvnhnspu4vde@qoqqalagso5x>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
 <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
X-Proofpoint-GUID: w0PJukxiwcnbVe4Un8F4t-BGx9noN0LW
X-Proofpoint-ORIG-GUID: w0PJukxiwcnbVe4Un8F4t-BGx9noN0LW
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bdb4d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jtJCHLo7aIGmxyxyT8UA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwNyBTYWx0ZWRfX4iIxVcnIsTnZ
 dljHV27HZewvxqe9EhDVW4wS3xJX2bIc59coehqXp2PSMdhOs1LnHPMYLAif9KopGW9Dl2enkxj
 pcaxOKTS68eeyakWUUDSjD2SsuYpuN3A6qqo7S9WSToponG71n9DwjM3T4ODO3M16miVbi/owCX
 QJyupOK1Ezys3Txy5+eiznWV58riQzLepNyVNX0j+eyUAimkgcUxMupFQomUCXOdpdQpLluSaVF
 LJ7efy+KqIrmV+2QpUlaNdfrIt0rDBgMjV/DZbsr7dZkHMyHEqeSbafLbnNVWlmn4QeF+Ba88Xn
 U7sTeqouONrb210K5VcZnyUR8ySi0eOgVtETr1sA4qIFIi++qT2nf7aImmZ6j7rXMKxLV3yxzQX
 02OMSTG8qrW1zSJ5hSM2UXP8jw/CcxU3k3PNmxW/uIBEjIz4WdNMvE/koGVzUlYrTuiCHK6LFDA
 rYKbamu2RRvlrBnrPOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240107

On Wed, Dec 24, 2025 at 12:45:21PM +0200, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node and mark
> it as reserved, as it will only be enabled in EL2 overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

