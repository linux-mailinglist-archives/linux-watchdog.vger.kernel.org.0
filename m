Return-Path: <linux-watchdog+bounces-4178-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2AB436D4
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 11:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FD55684F11
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 09:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9152D24A1;
	Thu,  4 Sep 2025 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwYl+urh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191512EF662
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977493; cv=none; b=N4HeZ+ZbVpoFrX2rjHuKtF8M+ituCa+Aod+Qfg0MHeSPC3a97DRYHlcftQMCJuKO3cVXLFysBdubv06Xn7MG5eWRQAJ+awcBv6dgYm2PKmqxtNhtGpwgYuibZqFcJzmMWmERay0eV63LjYQp2U6RcJaENbhgIf5QUvLXZ0VNmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977493; c=relaxed/simple;
	bh=okyI9VENEpsFeL+2iWfOIXetanLtRHN5I9oZ9851xAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItFy/8IalaPG4lnbVABNzhGUvzFKuIthT9ikW7AEF1/NyCvXxMySLAzhnrf5c3+V+aS/nuqNyJOJYoWMOHJTrxyqebAGMVyA2G7vdAOsWlFGRYbFMRxQGiBuWlUMfCIAlbpty/sAlAxB1EJgO6e1Vestxz5Ym1UdRZ9dJ3YMr8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwYl+urh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58415cIU029727
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 09:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qmq9wf97WQ04RGKWFb6wkMRy
	x7DWCe5tA3lTLApTcbI=; b=IwYl+urhBylpm0TjNvP5v4UPRxAb7tjWGHc2T/hH
	H24q5AaNp9gCrWh5uktCFyDs6sR+xxPMoNw5dKfzdVuRwyKkpYxaxJldIbJ0gfod
	PZu2vKPAWYJ9lRhHFGYJl1fmnAAsv5p4O90t+/U5qMGfyOmE9SmLs59EYrl+LZ51
	BKTHIYSHTSRcWXCFzry4EfbK5FWmebldbhXwB7qcGeQ/p9dGJw3avYSzxaA6aHCW
	FhbYZ/oVnta+j5jPOG4LhaoXo6V9kKtwRO8Wscv0UYHcBMHgozrQtvBkDhs0Augf
	qXTfak72aahvzG1/06p11o9lXmyGIY+7vUmA9c6csBhPYg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw06yrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 09:18:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24cc19f830fso12699685ad.3
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 02:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756977490; x=1757582290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmq9wf97WQ04RGKWFb6wkMRyx7DWCe5tA3lTLApTcbI=;
        b=haHQkSk69ei19lq36xNBVLBv8C/QIBfwQ/u9GubDtXg+e3gECIbF237iZtOnUdSW5+
         H/tFMfhvIEN52qQ8/AfP5rBvjRcOwvzUoZnObFC3/GcrtJ+fIY9DAtgXwSzqDzV9eAiI
         RP2ZqFNSqUj8HZrva8+0ndjG0Ugvv6wMB5G71oNNbTb18HVHX2rudnnE6cVenQKH/2AN
         nfoIl0j25RmKAU+JG1WSW7erZkcCE+E8DJ8R7uYZqDINuM/g06in5wEvOexNWXs3s7ZJ
         XyQOcmwRJGKNN+qxTBsc4FTBjtGaUaK+aQ/epQOvU7jCvyuecJ6OK+LzvmrKmZsgZ6vG
         B6cw==
X-Forwarded-Encrypted: i=1; AJvYcCW7z3jrftAC6l+p1WErnZyxh9n1S+Wy+qYHSfFzvaslUa1vvKIGFoR56xM4cgAoRJL2qEFdYszGfnyU1bjgKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSuqvo+X0i0x/m8kfdOPvckJSOQDwHiqm4Vuj6dGfaqRaviZzS
	CExqwXGKRh4XWNLSMu8RDS/dVRmUhUm9IHqd8VhIFVLvoiwp/R8CQS7kKaS5cKkKN6+qpMHjsMw
	c79P4Di+3SOafCE+e8fk0t/MESWnwPoB6p7tfVT608iLmFmbz8pwGNcPmgWTgVHEiYGrduw==
X-Gm-Gg: ASbGncvxLeIjN98YwtISIFAMbJcS8jf5B6D+6yvC3sAlMh+eDPYhQJNF56d3IJJPBP/
	oQOtHIlMHtTSl+xTq6LUn1S81XTzyJe4HG1Ph8PlP1/GDiE0c08B6mbgtrI5HUrNAbJtNu0wgCD
	X9jOHXDgJdntDxNKQ+ljZZhW9uqAXi5xPNKGsTkJlgeqbB02sZSj9Vvr+wZmBckNe+gPvG5FPmC
	1M2pVUHvGYhB1lNxRmLvMvpRwslsxap42l7/n0iiJevudO8nfuKtdMzX6Hf9grdbm2PbvHL31KL
	HSKmjJTw0aFukf2f5C7fwGXeGQAblrP/uAlSXljKOkXQYc6ogZCGphYPBcOFp1fsL2zk1E2czg=
	=
X-Received: by 2002:a17:903:2f0d:b0:249:f16:f080 with SMTP id d9443c01a7336-24944afb3ccmr234248805ad.52.1756977489607;
        Thu, 04 Sep 2025 02:18:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1YA8b/X0kiXwOjhDTMCW5oJYVAsU0R0JJ1m0N74tbsJnxiIQuGYYqpZFLwCSpwS0SH0XTgA==
X-Received: by 2002:a17:903:2f0d:b0:249:f16:f080 with SMTP id d9443c01a7336-24944afb3ccmr234248365ad.52.1756977489073;
        Thu, 04 Sep 2025 02:18:09 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm74820385ad.54.2025.09.04.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 02:18:08 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:48:03 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <ec0dc13a-30f7-44a0-9a4a-5f44eccd3933@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <a3af076b-ca0b-4d5e-8294-2bf5a9814959@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3af076b-ca0b-4d5e-8294-2bf5a9814959@linaro.org>
X-Proofpoint-GUID: fYScIr1eyo0nHL403P9_4rJb4TWzJJPg
X-Proofpoint-ORIG-GUID: fYScIr1eyo0nHL403P9_4rJb4TWzJJPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX75vYQO+KqQk1
 RSPYhNzntA7F8Hdf9WmyKYehkcpePOv0mg4Wa38aPAy6yxIVyiXJVnu8ELbLxu2T1HAxLMuti8R
 8/a2xa/YJDly8EQFHy30rHW+p7LQSHQI/SKA+qW977kQorfMezgv8ECWq45E2joMDufmVjO3oDW
 MHHAiokoBO/r6PLyagofXqjQJfhBAz0LLxG2aMjF9njhCOoLQiPYLKlxhJvc6Y8CbFtHCxIOG46
 Rsex4tm16lFOKulxl9AY+5FHODUFTo0SMGXAsLDqgdqfydchsEAgd3D+OEXz9zsGozWmnJLk3Pz
 G5k/uExtlN70gBQ0xCA3jnuDHlfya0g8ts9V8ycYgZX/h3mVTGFMyuIwvljtFe2Sb2jRXkURyKf
 6GP6VzKv
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b95952 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=bjUImR_lD7Cc3jxH_h0A:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Thu, Sep 04, 2025 at 09:13:23AM +0200, Neil Armstrong wrote:
> On 03/09/2025 21:33, Hrishabh Rajput via B4 Relay wrote:
> > Gunyah is a Type-I hypervisor which was introduced in the patch series
> > [1]. It is an open source hypervisor. The source repo is available at
> > [2].
> > 
> > The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> > access the MMIO watchdog. It either provides the fully emulated MMIO
> > based watchdog interface or the SMC-based watchdog interface depending
> > on the hypervisor configuration.
> > The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> > version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> > 
> > This patch series adds support for the SMC-based watchdog interface
> > provided by the Gunyah Hypervisor. The driver supports start/stop
> > operations, timeout and pretimeout configuration, pretimeout interrupt
> > handling and system restart via watchdog.
> > 
> > This series is tested on SM8750 platform.
> 
> Would this driver work on older platforms like SM8550 & SM8650 ?
> 

This driver should work on 8550 and 8650 too as long as the hypervisor
overlay is applied to the device tree which happens in the bootloader.

I remember porting some hypercalls to 8550 upstream kernel to induce the
watchdog bite in panic to collect the dumps. one of the biggest benefit
w/ this driver is that we can collect dumps upon kernel panic. since we
won't be able to pet the watchdog upon panic, the bite would eventually
happens and device enters dump collection mode.

Thanks,
Pavan

