Return-Path: <linux-watchdog+bounces-4187-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A1B43B9B
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 14:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8D21B237A0
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 12:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562352ECD23;
	Thu,  4 Sep 2025 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZpGWA3r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D52E8B69
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988983; cv=none; b=Z4cD3s8emW/NKzoEeiZujrwhYSOg0kVVwtPNOdnDqDHcKp971t3NDFxVuvs16KOfYigb79GkpYff5uuC/+w0DgR2W/2cXp8wQSUZOPrXnPVxf+F9brOxMLBtvITrLJ0nEV/Sh+xyImKmnjT8sZK0lHwNcX+DjqhA8WYMRXUROgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988983; c=relaxed/simple;
	bh=NaTSUK/YANwvnWqHuH4HFonnYt2wjCvewS1+Y4OYrpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOX80jKNq/695jcPah2z+QixAra2D274VxcVaorPnfO2D6KqVFPtt2AcbE/xPN7P8gllrPQiRT0Cb5NpVE8M3SLRWjC45MqKfBPhEUnBM4mO1E/uAP2xGQpZGOl/IVT7mUiDKfZBgSbFkWmuRVH+mAumHh/k8aZe0RQ2tZDMxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZpGWA3r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8un031806
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 12:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pc3ppLOamamgYKL4ljuA5P2D
	+67aLZBUnwJLBZffFZM=; b=fZpGWA3roXcngdgQOTUEWduGYoO+2gm4KtS8ymWB
	HS+XgTBlCzKFZNyjaDvycJPmvZaQY/dfwKFNjr7EXJgoektZ6I1aSMwL+KICC+ey
	NkeE8pRqsSEy+NeDJOVn9on+m1/RBqPWdejjHFsJWsfwVW/4K4Pz7Jgag4V1AxIF
	SU18LU8LqZWyHeOwyjpSf0yO45xwE0+K33nW9Vj6HIQo27DPQCdsZJOWgh94tAoC
	/r+fih2dlLqXwbHBPIl0mIde4LhFTS5bmZzAYjw/chcZOuh8BHeGPqTma8shHqFC
	LjTOiHBqRpYYkefDch8a/3l7IXMpXA0P9yBoxH6sFUaU7w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw07fuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 12:29:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737e673so1149835a12.1
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 05:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988979; x=1757593779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc3ppLOamamgYKL4ljuA5P2D+67aLZBUnwJLBZffFZM=;
        b=SPN0j6c+19PEaTicLBXFS+m4h/LKBkySmBtsRs1DxB7rJsTJTbmb6KsWqKslXKqVUU
         4TFVIeGPBb4AmXBof4jx7oEznlDgWMijZtiQ1yElNRa6uJ6d7HTMAFVvVLaQagA0CHwS
         wBxN1GuRuc/L0QRmt7wZjEPZAcivEkpLBKW8c8rbevNc5ZNkHOTvBq86NryTGIETuk7/
         Y8X64iInyPcsZTuS2EKbha07mI82NIAO/DvAcCitsnzUh/kkS3GxNTkkieq3lNjYVg07
         /XrGOKVFGLctTaRN9xB9tEB2Idkoc7fdmoKyz9SmwF0I7lxeCLqRNjh93qCWCxJEa407
         QWEw==
X-Forwarded-Encrypted: i=1; AJvYcCUOcmQHWJc6huoP3F3PmSi8WnbS76OSB6k+lQGWtIBucDRS6mqgY6Gpv7xGGh+w3TH5xI1fCzfJQgCktAOKlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Jt7bTbdqqgoraqpxPM0KVF/+01Qtof8ZCpUmvs0hYSegGmyL
	1zABgREYKc9Kl8LJn/ujvSjYiGYWZ+geFGhQd3M41OQb9S05dyHoX13ucCwLU3CTq4dK/WRMs8U
	50H5JtC/LK2xgP9ju0rl64Ekis7bDJFjHEC5xznGHLqhdDimzOPneyRUmcuVTqHW4XXLzmQ==
X-Gm-Gg: ASbGnctxZbQh/lveJQeiTfcd+nBp9HH7dfnx/97DH0jxAi41PqXvx9IVQR7N6n9GtDr
	GIdi2WCUc5VWW6OX35RnIqTVUOTvvS5PPf801Peyf5Udh9RtPnWL2Q8+SSqYXvZpVLuYjH1ayaq
	fPEt3AX4g2IjaOAnj2RKGnCMN+/wDgPWDuHMY6kAPG31ycD7nO4lhmA5jAVTIBOliRBSGDncsxJ
	wP8L6+E6N+6mS3zlqnXNtjREFERZLYrR9TjHwWOzkz2gES/K83+meRnx/C3R4597JddKJcc2aWd
	IFJ6vOGeFvhKxDkxh6FSfzGmfUIFV+OEfIYdGCeaCGxUKRCYT2Xv1I04vZU2+2/Ka+cJEzOAbA=
	=
X-Received: by 2002:a05:6a20:258a:b0:24c:2fa1:fdd8 with SMTP id adf61e73a8af0-24c2fa201efmr2769902637.49.1756988979383;
        Thu, 04 Sep 2025 05:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvPRvaReH6KDh8zVbVK8stgt0sMEICu2GPCxmS2taegtk3ckMVcnxPr1WUtE53eEOt0f3oFw==
X-Received: by 2002:a05:6a20:258a:b0:24c:2fa1:fdd8 with SMTP id adf61e73a8af0-24c2fa201efmr2769852637.49.1756988978833;
        Thu, 04 Sep 2025 05:29:38 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm5747866b3a.9.2025.09.04.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:29:38 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:59:32 +0530
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
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add binding for gunyah watchdog
Message-ID: <4316b164-0d2e-48fa-bb0d-977c0b223c7a@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com>
 <ea295ff6-5395-4470-afc2-76e5e2dc9fb5@kernel.org>
 <5210a5e2-0d75-4532-b3ca-1cbdf8ea2a9e@quicinc.com>
 <af074048-1999-435c-9405-6ffa09eef6dd@kernel.org>
 <16c0d8f4-4a6d-4d65-90ce-34c86ebecfa1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16c0d8f4-4a6d-4d65-90ce-34c86ebecfa1@kernel.org>
X-Proofpoint-GUID: BgL0mceUspO6xjSGveMiVd-cMPxUn5pD
X-Proofpoint-ORIG-GUID: BgL0mceUspO6xjSGveMiVd-cMPxUn5pD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX3PEUF01ejM9n
 Kd4rI9CvxK7yNeI3ESkeScvKKS/9Uc7s7kDEXTAo0WsRcKLBdCo5fXJGXhqVCiQdBIPNlrrmXGG
 gmDda49QegY3gt5BCPW9UqAj2mu00t/uU0WYwaU7mUCa/frNuxm/bJkUfydJk02Wgh2zUoMhCws
 90gKu4jbKUXDVIPkpq6EGiF71T7YgeLRSFqAyscK3pDE2I4WqsqDP0NxnOrMVfUi7okQQzjI3J7
 qX3hXhWfmkx0F4O7PT0U/jz2DQVEJ8iHoyTjwbUlJ86x3DEOP+MN7dKJSIt1/KfOOLi81ISBYhF
 +typoCIIk1vKvBDfLKZ/sJNbbVn00Xu+6FSJCedLd+QnEhkJaCINPXUzLnX5MCe05AxIqi/WFQA
 eGm9hi+K
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b98634 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=E1Ov9k63nBnqAXplbvIA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Thu, Sep 04, 2025 at 12:59:14PM +0200, Krzysztof Kozlowski wrote:
> On 04/09/2025 12:49, Krzysztof Kozlowski wrote:
> > On 04/09/2025 12:16, Pavan Kondeti wrote:
> >>>> +  compatible:
> >>>> +    allOf:
> >>>> +      - const: gunyah-hypervisor
> >>>> +      - const: simple-bus
> >>>
> >>> What? No.
> >>>
> >>> Don't create patches with AI.
> >>>
> >> I am next to Hrishabh when he is writing this patch. I can confirm he
> >> did not use AI :-) not sure what tool Krzysztof is using to catch
> > 
> > My brain?
> > 
> >> patches being written with AI, that tool needs some improvement for
> >> sure. 
> > 
> > Heh? Seriously, instead replying something like this think from how is
> > it possible to come with such syntax?
> > 
> > It does not exist. NOWHERE.
> > 
> > It had to be completely hallucinated by AI because I cannot imagine
> > coming with code which is completely different then EVERYTHING else.
> > There is no single code looking like that.
> > 
> > 
> >>
> >> I will let Hrishabh share why he put simple-bus here.
> > 
> > 
> > It is not about simple-bus!
> >

Ok, I see what we messed up there around compatible property when adding
simple-bus. Sorry about this.

> 
> And to clarify: it's not only about this part of the binding. Entire
> binding is terrible, does not meet any basic standards, does not follow
> basic principles of writing DTS. I cannot imagine this code passing
> internal review, so hallucinated AI is the most reasonable explanation.
> Sorry, if you send extremely poor code using patterns which do not
> exist, that;s either huge waste of community time or AI-based waste of
> community time.
> 

Point taken.

The intention is absolutely not to waste the time of reviewers or
maintainers. We will make sure to apply the lesson learned here.
Thanks again for your time.

Thanks,
Pavan

