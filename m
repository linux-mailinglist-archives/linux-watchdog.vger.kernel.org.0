Return-Path: <linux-watchdog+bounces-4491-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 319FBC253AC
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 14:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AC45E350D0C
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 13:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A9F34404F;
	Fri, 31 Oct 2025 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWXDynPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1pjdOwM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FAB278E47
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916794; cv=none; b=ItGoaubro9+ldcfU/cBr0tc6wOnIUmZ1GnjOW6t3SowNK75HQ0JP59PaEpqhMSihRerVGLfU+yUsEFcX9ITq7J1H30n0QwjWxTnPIgVPM3FbDd+3Gsh3sXARRqWaZJNnXPOMK5ZzBbHEvS54Q8NBsR6Y+jsL3kLzC5tptGxh3/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916794; c=relaxed/simple;
	bh=kKIlQC49+1HvPMZ+KSY6IKOFV0Kf/+b+20LKz34U5yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwzsPh14qzUFwze8F/Htd7AWa3PnVhxB+41W4k4B/w4EtcB5TCaqkHWZnqEqZfL7YzW5evNbFGP5BU4T+dWXoDSx+Xcjo5dn8RQCJOUkXrYZM5q5JqklBGrNZ87FHaA7gU57wCUJX7CIH57n9P2wAElRpnDznFwQU0cxJT8wRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWXDynPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1pjdOwM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8o4jV898088
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 13:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i1q+8kjbF6ZsBZxOZVi0iNgl
	M800iA6/f1hi233PBSY=; b=ZWXDynPNwl8wiZazuA3y2ocv1d/aLxaGDtl82VqZ
	EJtTz1fL6bsdzJbYiIqWIE1t1WEnaqsBLM4jIlbwx+DVvIotP/zdEwBmxc0MBiWH
	2beK8WTOw/gZHacDNqEBkRLhP0vh827gI4xjjHsLYghT5UXV0gOl2mprGb2+VcUK
	3l1H56sAOQxuCeCsNuOKEX+dntEu6GDfnWRoFcWsDDeV1w7CtdHkF0Xc85wwckKK
	cQt0GI+bDoA1odYCOjt7l6ifAtK3UwFmViJU1/w34KixwQV5tTy/fQGIxiubqos9
	2Li5JhKwouut+803Y1zYcoILNaRgKZ8kfYwjTu9jhuaPLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb22590-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 13:19:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2952cb6f51bso11311075ad.2
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761916791; x=1762521591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1q+8kjbF6ZsBZxOZVi0iNglM800iA6/f1hi233PBSY=;
        b=K1pjdOwMQmIt7MXhmjeKr0ZdOz6v2iQ+AQk5lDa8HoyIlTL787GjS8YEZfIssWt+l0
         agpcljPoYoU2BnHu1qzlX0SieWeFp3MA6Lt82c5LR+ZypqjZ1pIz8/fDQ2m7aHsBcdim
         IZd6Q0/ZHSVUCdc2aOPncyUGtiAcZxNCbWmhqbIiq6QLZreaztpghxUjLadyQphzAxfW
         7Kf/bWHNHcXGzWHoL9V8fyntbw+3ezhBUcpwAl1NMne6RMl4IEOh7qk3R6FMzcga9xrH
         cVwe8wVY9hEL3Jn9a1tK6HVDFq4+KHxf4CkfK4utS+OyUAwwrZUOQbGG6IvZsNTf+oQj
         4bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916791; x=1762521591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1q+8kjbF6ZsBZxOZVi0iNglM800iA6/f1hi233PBSY=;
        b=E8t6CwrwTU5AUFJYT02W54mZVVYO6fKnbvyREG9JWS8TaeBaZ6PnKjumLVQqmRPl9d
         du6iGB7niKt3XkcuA8jxE3ZOFI2dgPuU0CjRl/LlYT7krR/gCN3cjQAX0rz0oidOc16S
         e+K40IvY0m2Pb0R/vawYt5mMPzuRwYcmVcx+oAnansWvLyPn4xn9NWf0/r+nXLU0/EzX
         MU/uOAWHU+fHMYhasYE0SpVdd05kdEn9JqCmM5CTjSbx739UDB5/zTKFcUIb6LPrLesE
         6I+Igtg2VSBVIqHly/hBAYDnLdWM3F508rmGcHZPU4W3UAQzdP3HC4eR/BL8q4ytQycQ
         z4/A==
X-Forwarded-Encrypted: i=1; AJvYcCX0sjdgSCFBoU1x9RkmUZYLEK27riiyqXwJnGevT/0KbweFy7dUdG2H/GbP7nCKfLRNtd/y8GTmgQc4Fv8gTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjL4NIkpDu4B2RdNAj2hMlTJaCsJF8xacYuLpraeETegyMq7Ze
	950kg+07/3dScFRAakKTgy/dyntuOv3lYx6ywVu47W1iSDI6AzBozeXCdqpiIVQHJLm22LvJSrN
	mCBGk8R/NEPTvZsm1p31JEAbtGWvBsq96djxywR5tu14E3lbKNk1hw12G+Ub2w6GragKPHQ==
X-Gm-Gg: ASbGnctkAeN9hpKfJiwnVABXdabiPoOPuaUIOknfy9dunqZaawJ4CE1rVCUgq4uqKNy
	+Zww2yc6lM6G+PZX/YQJ5xvWlbB368vwHyt9cJJQJSb7KHDK+BoQbdHiWvH/HykZkl2Iu9GG3Wy
	1AA+8AOfEhte/JhKwnzJ6XI5P1E+O76KY6Sn9XI7uz3pApeql2IRUpl9jbVBODOtKZBUgh2UN7K
	bXHHigNfKNcqEpZ8YUz60Vbfu4yAfiPU2B2lWKX249dY0HY9wQVHmsD5c2y+JVjrsnCNpGb9hLi
	+2k21mb2DaKwfDyCzmrEnaE8bg7qwHELFv6OYWiJislos6dNjYAbHbsRnh67KIDoubz8Q9IFtiZ
	c9ZGKoEHAKWtwKXEHGUluRwQRMmzZVQ/o
X-Received: by 2002:a17:902:f544:b0:290:a70e:6261 with SMTP id d9443c01a7336-2951a361f70mr55559705ad.11.1761916791083;
        Fri, 31 Oct 2025 06:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWz7WaGspHmY6hwyIZRpl6IwBTpTBuIV69EQKKehTnyEv9Oq+hWYVVrkE1+HxBN8oUAGfLBg==
X-Received: by 2002:a17:902:f544:b0:290:a70e:6261 with SMTP id d9443c01a7336-2951a361f70mr55559015ad.11.1761916790332;
        Fri, 31 Oct 2025 06:19:50 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696df55sm24405685ad.70.2025.10.31.06.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:19:50 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:49:43 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        hrishabh.rajput@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <51372234-0fd8-4cee-a296-a5e8626b52a8@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
 <13d2963d-e931-4e51-b875-a1650b899bb7@kernel.org>
 <09e8485f-f512-4069-be9f-3e94fb142aa3@quicinc.com>
 <68b2b40a-da98-46b8-bf48-ce17fb3b79cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b2b40a-da98-46b8-bf48-ce17fb3b79cd@kernel.org>
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904b777 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1ZP6r6y3UWDVpadotx8A:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDExOSBTYWx0ZWRfX7yjPIMJE+lQ1
 6lIWASyCYiqYTWO+d2QdOpI8r0rgtBg4wlmKecplvlLsZfGDoL+7UZHCJA8p0xLVkyjgjxDk2sK
 00oheHRuYIl9/vRJwwucok6z8xe4nIibjj7C/BCeml+/Fw8ktMws5M6JeGAGmPDnXPTTsPvAov+
 dEqBp0unOzW+lgrkJixFyBa409zl9wFzv+woZ9jODDB3szmcxcfmqE//08T3jj7bKPZ4/3iIxN6
 4Qmt8O+StM9m4BQ7HrljdUuPUhQWqfVSWSsZa2+CIqLgn9ZCVMZwFctRZ0Y/rWNw2FsnNoThbpa
 9tf9AKZRt/DmLN+H1Q2r5Crv8LD/rKHxUsrpX/tPlTkyqXMuq1tuzHMjnwQTnYbOLbr3YKxdwIU
 a0Lqp4G66xsSyrSonT1sLPDUTcLVKg==
X-Proofpoint-GUID: SgvXMPHj8WCV6KuQlIRkesRnw8Mmrssd
X-Proofpoint-ORIG-GUID: SgvXMPHj8WCV6KuQlIRkesRnw8Mmrssd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310119

On Fri, Oct 31, 2025 at 01:39:11PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2025 13:11, Pavan Kondeti wrote:
> > On Fri, Oct 31, 2025 at 12:48:18PM +0100, Krzysztof Kozlowski wrote:
> >> On 31/10/2025 11:18, Hrishabh Rajput via B4 Relay wrote:
> >>> +
> >>> +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
> >>> +
> >>> +static struct platform_driver gunyah_wdt_driver = {
> >>> +	.probe = gunyah_wdt_probe,
> >>> +	.driver = {
> >>> +		.name = "gunyah-wdt",
> >>> +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
> >>> +	},
> >>> +};
> >>> +
> >>> +static int __init gunyah_wdt_init(void)
> >>> +{
> >>> +	return platform_driver_register(&gunyah_wdt_driver);
> >>> +}
> >>> +
> >>> +module_init(gunyah_wdt_init);
> >>
> >>
> >> Heh, what was my last message? If I see module_init() I will NAK it.
> >>
> >> At v3 you really ignored entire feedback and this one here continues the
> >> pattern.
> >>
> >> NAK, please read how Linux driver model is works.
> > 
> > You mentioned in your previous reply that
> > 
> > ```
> > If you call any module_init other than module_foo_driver I will keep
> > NAKing your patch because it is wrong. I explained why wrong already
> > multiple times in previous threads and other discussions.
> > ```
> > 
> > If you are referring to why module_platform_driver() is not called here,
> > Hrishabh answered that already previously. Please see
> > https://lore.kernel.org/all/ndwwddd7vzjpgvzg55whdno4ondfxvyg25p2jbdsvy4lmzsfyy@jnn3wywc7xtp/
> > 
> 
> 
> Your commit msg does not explain why this cannot be unloaded. What you
> want - intended to be a persistent module - is not relevant here. I want
> it to be a proper and regular driver module and I said it last time.
> 
Thanks for the feedback. I am happy that the only concern you have is
about unloading the module :-) I feel that is the easiest problems so
far have been pointed out.

Hrishabh, I belive we can disable watchdog via SMC interface. To make a
proper and regular driver module like Krzysztof is asking, we can make
it module_platform_driver by implementing remove method.

Thanks,
Pavan

