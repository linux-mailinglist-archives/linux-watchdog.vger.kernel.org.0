Return-Path: <linux-watchdog+bounces-4198-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 671ABB44AA7
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 02:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6501C7B2A8F
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 23:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521B41367;
	Fri,  5 Sep 2025 00:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRzAF+la"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42247483
	for <linux-watchdog@vger.kernel.org>; Fri,  5 Sep 2025 00:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757030463; cv=none; b=fManGNmonl3cO8O9fncop7xuytENvrS8J3/36phT6HOG3dXCOGr0h6qfFfNfBJAD44u3gzlvYwySzOwIRunHIVhMkIiOxchQM37J1YifQ5TjTpEI+sYGXAGzBT5zFMAcIYjYbN4UALLSRP+1PGs/cb8xtmpDO4Lb4y7P/WjvIf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757030463; c=relaxed/simple;
	bh=0w8CuldlphcoO+tfKw4Vvvi3ndsc/ILcscWmhU+IA2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mzf0UEcAYpFhdrYPjXQ9IjpqfzEVfb0xXGO3xSQyqA0CyjW0PsLZzNBIWKDuA54mY+yVpzRAajz1v4lxhFt/hf4TVjuSEoEKLwJTjv4dWxSyFaV6Xih8up2HUrhrnYmRYUMBrFRr6RLrS+TVLKRog63NjPLdICv4pTU5qiKLye0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRzAF+la; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IbFkq022232
	for <linux-watchdog@vger.kernel.org>; Fri, 5 Sep 2025 00:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0annG0Mntw/ZyjPohAYmMxqB
	n0Karvid5pVkJViH9m0=; b=LRzAF+lakUH45oZMSsMsW8qDkTt1MyBthfz9jE7X
	X/EqAUTyB0qrGk6uQhAPfCXl3ohhh5dfvLbmYSnerLwWHIZGMl0MkGrG/4QHsgrG
	Y12JH1mzA2QJCrqYA9n3PiDaBAGL0kvrL1SsrKVtv4nqbS/RjubcJMIUmQDQfaOz
	OcgAXnZzW3wKRZ4G0mLfKNDrcsBVB8YiO3M2IvN+pzxatpe3O0NcOxk1fHEPVY15
	AUmsGXd6aAJ3ORO0f4s881g+TbmpMiBzri4X1gq9ep04KLq0mr0ZrHLVIg3YS8hW
	wsZI2vlJ9ommlkO408nE7QMz50D+/ZBWNdBMWau1+0WdeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9931n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 05 Sep 2025 00:01:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329ee88fb47so2492382a91.2
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 17:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757030460; x=1757635260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0annG0Mntw/ZyjPohAYmMxqBn0Karvid5pVkJViH9m0=;
        b=FbRfMJGd6CLIYdy9yq80akVQTR4L0Md97rPSbkAVQWWwT6Cr4gJOZeqX5r7co+NuIm
         uHEMT6LYlk88D/TBkzfIpxbJV2AJMP5Vo6pj6IGvAt4lBToCR1u0Hsc3a8NzwU1i6Z9e
         mcnQw90Cfi2HEBBHSTwYk+JvXnOYxCI9fXgkQlKBUbIa5LWS+kt0L/U5RRlFtNiTQl8d
         q6rr6ldtHbhoNRTv7PkLNac9/YATmOizXD7SzgRQhLV2nFSZOr9S1YvC6FeDXo4uI1vE
         bNCPiuyF6m3QPhykGogxWYdae8ybnCueCxEBDF/6r1HqvhwxdBq7eW9dlASQJx4qrh4f
         p2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXuqnjLDR6tOxVKrZUx6iBJv/hcWeOwZXfUxKN9CLFLISASeMxC8AbUT9ZQaU+AqCapoLZJ3+YRjeu5YIMM7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YylcIlWG/0JOTvIp0R6/1s1zJUK/ryK0A37CluPMdPbQVlDt7I9
	JROA98RX2QchPxiGtY6Lc4yGT1nSVONXG0k8HPhMIoZa1P1o9Wl5O0+1hKq608FfgwkssxJOM2c
	ou73TP1kqk/tXDcNjkWxsu6T9Zk14Kqv+rzO4IDX98d9HcnFquW5D8OgpbTGn3SbDsAMPig==
X-Gm-Gg: ASbGncvDj9mfSNj4BAlRf+akI3o/IZC2tGAQv+PifvzaGXFSPtA2sVqCPIC67ExI4vx
	nOAqkRbye0FeytPlAW8uYgEfXJEg5m2dKyn21imo4f3HX87McIEoooDcd/9dkOafqDMx0JPbJDu
	G6dwjHLEciASGdrNwEqPsjqG6krnxs/KjT2zuUM64EB047hCoJQQuQSkEvCDicveHUiXZlXKEQ4
	Ne/T+KmkumeVBTNA8zTS7BReRQ47SitVsZVNF3m/yPKAX+qJPvVGcOX83krHvELCUZNE+i/84SY
	OOp/Za1JtdWSeBfV627SrG5Q2oatDP9gqiTDqKFFv2sYyaC4HjJJiWI7lxXXWvJbv6vr1Ztr/Q=
	=
X-Received: by 2002:a17:90b:3905:b0:32b:8b8d:c2af with SMTP id 98e67ed59e1d1-32b8b8dc8e4mr6768834a91.9.1757030459897;
        Thu, 04 Sep 2025 17:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWcMG2DBkpOF6OBCTvV3qoquHwdXXHofKvm0rh/l6U97uk95e83IAK4maO0o3OOvqIAwx4fA==
X-Received: by 2002:a17:90b:3905:b0:32b:8b8d:c2af with SMTP id 98e67ed59e1d1-32b8b8dc8e4mr6768715a91.9.1757030458813;
        Thu, 04 Sep 2025 17:00:58 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57b232sm26732940a91.2.2025.09.04.17.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:00:58 -0700 (PDT)
Date: Fri, 5 Sep 2025 05:30:52 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <99cacf08-0fb4-4b44-9036-96ea5fe01c10@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
 <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
 <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
X-Proofpoint-GUID: McUBe5td4zIjAyeYV7BmLyZ64QSTYyME
X-Proofpoint-ORIG-GUID: McUBe5td4zIjAyeYV7BmLyZ64QSTYyME
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68ba283d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=yPAEAbfnkOYWZhAY5OIA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX2q+hshrrbii4
 1sB0KucVVBGuZC8aWbvY+E1GTfYzWWkiI46zNHsPtRuuYvWYVLJ28TJRVDqoWNDGit+NnymcIB+
 aP4FjwbktNmn9N8PQamiVLD2ropCAZXalzHUw3qsFN8XbZ2hDGSyCR13r+nGnKt0fqhayz84kNr
 Vqm77Dr1+CATltk7TUWfCsL5hNZpKfYOdmICAR/Jm4GlJ1+wxUEwMQJZqxvw1VSGk+tk9Kjqr3l
 cY2MpZUxfNX9WHhVr0cOK4yixCD9YdqVOBYObL/14JzOZpUg4nB2/Bux7LOew+LIIlULXI0pJ+N
 od6Y0Ehcvg/K61D8rR96Y7vOJb1c+xN4J9h2o3J5Gfk2oZ0bnhxY/nueEIofKOc8JAdoE1rt49D
 c6ZhC6wY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Thu, Sep 04, 2025 at 05:51:24PM -0500, Rob Herring wrote:
> > >
> > > Why can't you probe by trying to see if watchdog smc call succeeds to
> > > see if there is a watchdog? Then you don't need DT for it.
> >
> > There apparently isn't a good way to tell from a running system whether
> > Gunyah is present, unless you make a smc call (which could in theory be
> > parsed by something else, say a different hypervisor..), but then this
> > patch only introduces the watchdog interface, without all the cruft that
> > would actually let us identify the hypervisor, get its version ID and
> > perform sanity checks..
> 
> IIRC, last time we got just a gunyah node. Now it's that plus a
> watchdog. What's next? I'm not really a fan of $soc_vendor hypervisor
> interfaces. I doubt anyone else is either. We have all sorts of
> standard interfaces already between virtio, vfio, EFI, SCMI, PSCI,
> etc. Can we please not abuse DT with $soc_vendor hypervisor devices.
> 

We are trying to make the watchdog work with existing SoCs, so we are
sticking with the existing interfaces. The newer devices will not
necessarily need DT to probe hypervisor interfaces.

To answer your question on why can't you probe watchdog smc call to see
if there is a watchdog. Yes, we can do that. It is just that we won't be
able to support pre-timeout IRQ. This IRQ is optional for watchdog
functionality, so this is something we can explore.

Thanks for the feedbck.

Thanks,
Pavan

