Return-Path: <linux-watchdog+bounces-4515-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 371DBC35916
	for <lists+linux-watchdog@lfdr.de>; Wed, 05 Nov 2025 13:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9719D1894595
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Nov 2025 12:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86FB313E2F;
	Wed,  5 Nov 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBgt27An";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuK/1PZa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A4313528
	for <linux-watchdog@vger.kernel.org>; Wed,  5 Nov 2025 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762344714; cv=none; b=imCHHVnU7x3387cKj6XXOgTxpkQBdx5AhvOpotNMNKFn1cJsMWTvahmp0UKW/GrJemyIAyEyL+zmd9TIxiVllpAQgbvpsXKqDkB6x2CxnV3RtOZvtgVEDXFctBtLmOnyenkh7QZJ1gp/pn4GshjPKdx0R0tCFauYSS43b2GCMyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762344714; c=relaxed/simple;
	bh=wz5ENZt5Ic8O9QlHYo2XewF50GZ2Oa7k4QWZhPiExVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEl3cMVGLwUSEIX8h2UKAmgTk05soB2gPO/7XzDZL6Tt4sCjmt2csQJRX+y9Kn0TS58pMJJUkOrdsyEUoIjMCV/pQN4qCApX69kmAULTUbgiOb4zXUl+S81JUgfyn2RmpwfCkJ/rr+NHr73SOBIIbOIGIMJOf5pAici72ld+GC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBgt27An; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuK/1PZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A53sxhl3915283
	for <linux-watchdog@vger.kernel.org>; Wed, 5 Nov 2025 12:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=snsQD4l2AXcjWmxN/fszbJ7h
	2kOikH95rE3CwRz2zUM=; b=EBgt27AnuOFLD3tZKyOpo6xD83u9A03VmGfBkMds
	lb4PiRYRzac2NJUvXa25gcwayfM/C83TuN60XmLEvyvKWPb2RnxBWFVfmkAJvjc4
	IUzvWYXBTaE5fvYx1WplcRSpt2ajYXpCQtvuGYakjmSqw4Ct7cS9dWTA9iPgrsni
	plxpBkZ+XqA1YbobP4Ez1BIiNFmpwJ5vF84rpnN/Iy6iAlUPD9+Bbqhl57qvKe0t
	Gmf4VZSy+E0KqIwbt8qVP8wFpIksJPSQJStcFGwGqKRUz0NZR3OUohHptKpVtxmD
	MGYVGPJIzmsEgR5KIPmxdDujDOY4D2mmAbF0gW2bKlU9JQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y3797a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 05 Nov 2025 12:11:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295915934bfso55323065ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Nov 2025 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762344711; x=1762949511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snsQD4l2AXcjWmxN/fszbJ7h2kOikH95rE3CwRz2zUM=;
        b=JuK/1PZaEeaFxAxhp4ULGwfAuw30sVqZx9YrQL80IrRkw30XLqPk5uZjyWBxLjF2Ku
         pRoHmhk7bbWZmDGyDwHuvdkqLon4dF0DvBQPuFWXBx8TZ0WpAkIdoaOS2LV+im3BXEkw
         YsavRANfyCgr4vcHCguCw5xQEJCHRVRwlf5FLFz3NVR0QH2SjR7YZLHZ4trIIkeBzy24
         bYeJxwaleM2iRpsFpwvKQyw85Ir5+zstwL/jt7q2qt1WAcM1UchSEm7GvZ9LTtPRUMal
         FUZSM2hiKp0B2fcugI0riFu/aBqpFv/C54F8EVHdvPavAj/InjWxt+033HGL1D9UufPW
         nn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762344711; x=1762949511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snsQD4l2AXcjWmxN/fszbJ7h2kOikH95rE3CwRz2zUM=;
        b=CeO1oVo62ILRJy4If6x7hWu4Ho67/LLRd5qA7sIA3ioTC46J5o1sg+dQJ26ftBJCSW
         M5N8Zyvu+SJrUs9rWYjapXwo+T5iQDP8UiWZubpZMX243nW+YhN7K9f9OLdCbJepPJMS
         EkQjpiq11nn7wRfGv4m0ghWjjP0jQPTviMRs8DDhqNK2ji09ywIMXxM7dyLwdESd2XR7
         NnoKFvj4zsvqmgmBARfVeMsyCMAMBAWOAf2IJy4QRpqXA1U6mCLVEr/6Hcl0q3CBs6K3
         JYV1jVdyspPly9+D8cZMWF0Qgk4H2VXWb9pq+qDGYFUMr58U6zJLP+2+EIvTODNqn/yr
         0eLA==
X-Forwarded-Encrypted: i=1; AJvYcCX0/kkwFHrBAHS97PalB0yi+2QTtDp0M/FHRs4b72+qEXG6BBqTI7cO9WLGGqBo+kwU2ZKiZ0qxk+77xXBpgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+u9eiD2IMDYE7MfK/Sd4D8e0qX8lvE13spE1bX39TFVUQbg1
	N9XuRPowCUsgJyKnmY31Kt80iW/Adntzgka2Pi3f4WL6Zm33fGW6NBE52I0WezUlQWRQ1v2S89c
	4yldTvsDX9WKLtmEAPTghARnEL6M5xlGXYX0acDuewxQchguuJL/nPC98Am9rWdYDuaWwNw==
X-Gm-Gg: ASbGncvKSA8LakSH24k0HFnA/y7+ds7bbn/vI8kSEdbZeHfmO/WRqAbH6yiPmT1reto
	QcN9XivhIZxKHpXPMIsrb2xa43dg0En3a+3++OxWQ8U8Jv5C/kQ0kkwLeqVPRCvMbR26xAodmLW
	gFVndZGfA4/IgynfJ/ZT+F8GdhaB/BYLXXwq1+YeSZ47+AkYEPug7a+v5lFP/ChYu72qPF3trsE
	xDFIgl4BMP3QVELTpO0soBw+YcV8COa1GfRW4KsnY0fsVqBmMdNt0QHnl1x84nCMF6LytPHSbbG
	6NkZm1o4H8641c40JRFcTNOY1ogmqjvZqjyY2xbZroalJKZ565VzuXy6FgWBd3dTgOBT/FOHspn
	MU32N4agAnliEaHU7WgtrqvXbTigmUqvM
X-Received: by 2002:a17:903:244d:b0:296:3f23:b939 with SMTP id d9443c01a7336-2963f23bebbmr12373305ad.42.1762344710493;
        Wed, 05 Nov 2025 04:11:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiEWa0ffKN5nZV90leH7AWVaVvhnOx2CMq8Af0ffJqTrfJblGjM9mAfQcc/g0CeJMjYVL/Ig==
X-Received: by 2002:a17:903:244d:b0:296:3f23:b939 with SMTP id d9443c01a7336-2963f23bebbmr12372795ad.42.1762344709954;
        Wed, 05 Nov 2025 04:11:49 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a60ef0sm59997125ad.83.2025.11.05.04.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:11:49 -0800 (PST)
Date: Wed, 5 Nov 2025 17:41:43 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <729d0806-0f92-45a3-ae36-307513f8b808@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
 <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
 <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>
 <ykg7mwgncmvdap6xzyhmgxu6ur62zzfk5nd3tqrkivugn4w474@rkazrlhwbhtj>
 <2ef1d795-5cdd-4465-9333-16a02207a806@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef1d795-5cdd-4465-9333-16a02207a806@quicinc.com>
X-Proofpoint-GUID: kF9V00emkcB4FY3vdZhatx-3ZJpuzs-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5MiBTYWx0ZWRfX1k/QlPtGBdK4
 mxovcjSgzZaYv5QyKBZmHp/yI5ryNrOdoNwbxwd7+5bFyVJ6lbAwIDavSSh1Ck5RCgxLVDaW2Zs
 tK5gGGmJQmL/MGNdZ90pr67HY62iN4wz9ygctyrgoBU5fImChw/V74l4TxJqdIeM8u+8fSqNG34
 cawn/+VSEs0J8YaXD2RERRudeaWntej5fFRedjjZNyevqa3TmhrnfHU4qyev2ypbv+o/9kYiVkt
 WR5RGgYWJVotBNXeCLv1zkJiP2YyyQt18DQXSIT/yHgzXfOoYNNFAvTs6hIVGvz7Ipm4Q9k82gW
 FzYL+g1lNhRBBFGVu8uqYHI7/MSom8xVMGJb3eB2TyxVR7CYc8Pns8itDHtRzhThdZUqP63zbTI
 ST5/s8yEkVoX3n5ncpGlHt5wU1L/iA==
X-Proofpoint-ORIG-GUID: kF9V00emkcB4FY3vdZhatx-3ZJpuzs-9
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b3f08 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=v0qggLAlYnFivbKH520A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050092

On Tue, Nov 04, 2025 at 10:33:52AM +0530, Pavan Kondeti wrote:
> 
> > I presume if we determine that Gunyah is present, and we haven't put
> > sbsa wdt in place (e.g. during bringup) Gunyah and Gunyah WDT will
> > handle the outcome gracefully...
> > 
> Yes, we are told Gunyah support SMCC based WDT even if it emulates
> SBSA. Most importantly, we have STATUS SMC in gunyah-wdt probe before
> registering the watchdog device.
> 

Thanks Bjorn for asking this question. I have tested this scenario on
Kaanapali. Since the initial platform support patches have added
watchdog device, I don't see gunyah-wdt platform device created. When I
removed the node, I see gunyah-wdt platform device is created and the
driver is probed successfully.

Since this patch checks the device node presence via
of_find_compatible_node(), it does not cover the case where the node is
present but marked as disabled/reserved etc. I think it would be good
to add of_device_is_available() check as well to cover this case.

Thanks,
Pavan

