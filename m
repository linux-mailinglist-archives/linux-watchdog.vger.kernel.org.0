Return-Path: <linux-watchdog+bounces-4180-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C18B4387C
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 12:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E80168432
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 10:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C2E2FC88B;
	Thu,  4 Sep 2025 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2+Ubdhu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CFA2FAC05
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981026; cv=none; b=iKp6qn/RUKJWSa0o2FGktwGtMmM8KdlG4kYdmSgt4q/T91HHXjZhtDzzW4hdZa4gjxXl1x66eSqG3r37AVuh1eAHtZ3rX5ff7krZm5HB5MJFkVBL02oukj4kZMUZt8N3jxKSJxnDwz2N8YTKL7GebtPl0zcjKXkupIA+8W/035A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981026; c=relaxed/simple;
	bh=7MJyzBaUxP9X5PagJDcFR2Xl0v9tA5iGZjMRO04beHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLLWkH4vMD5bt05HRbLQYc7nxKHYeuFUNB8QZGEiPIeE4OJmOEvSuq5ge9H6nfelcVPiXTp4EDoaBAO+PF7MZTSVgNZTkuvjgBpMKrdRUgrHEJWXLAaQ/8cMwAQTAhqmFtjSiZtX15J7N52ha4UpPUe+neIt4c8f+DsBJryCkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2+Ubdhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XAZT007684
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 10:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rmgllivFRv6RjPwaBGym+Zby
	4n60SrTDmfiiEvhrg5E=; b=b2+UbdhuhLawegkDcLTK0dX7H/ggcXf3MnP37WvU
	c2aEonH9wF0KhNcaKD6oLOfakxBTr58H8WNkcve053YRYurMvjEzksh5jwxIUozJ
	pu2nu6SPAxDk8IAeTeaDOuIViFGlAbA6GDH9sGYi+lXbti1tNjB0IB2FqbRW2jrA
	YNVNmCacrLyh/GYV+y8Ol4dmdbzNn/yHEKicAmEWWN88PkZlVIbEEe7nS47rbTvX
	OYv5eLMFVOOITqurcEpiqbSnTgfHeogQWBGsH7z+A0qcEpUvtY2EMXsutsK0vSfX
	RGCP5nM6Wh2Lgo3pR/mKoA/CpcoDH6deWIDYQhMHLFxt0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8y12g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 10:17:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445805d386so8507005ad.1
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 03:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981020; x=1757585820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmgllivFRv6RjPwaBGym+Zby4n60SrTDmfiiEvhrg5E=;
        b=gEQ5gwiySBdKeA0BubsFsev/egIkiI3XiI0PR/ooVBLW6p6Un/QtXRmVuVsxLGgfjd
         Yly8ecvJeG1UwojjKcKX9N1fRFEsKfHIzhQHqal2HxtN/XGPSJneEVGCCTvc8cHkFQ21
         2PgEQuRSaO5kiW7BMbB08BPBFIIJLn9FFTuYlSK3PljC8str1tVlqvjKlauZjXSNNX4o
         VH1doQ+43UWNIby0PbeO/h1/TG56P127aXtcRae6Q5IcS1+kuGyH8hvJNbxW4HVOgBV0
         Hrl+aWaJTFoanB5RIGLdDYz/lTCX3Sy66mzjP/oKaSeH+MLJ4VVP0cDI8j2OyZWQtO19
         sh5A==
X-Forwarded-Encrypted: i=1; AJvYcCULqJupeMUcS1fMcuVQkEiyT/Y5mNb4UGRJNKA9FwMe6o3PZj3MGzs8Xa+3P8qFC/3Ux5csh1D7hNLrfNCRxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/uorCuSiATVEah0qNa6OBPW9b3lju1/AJbnYpq3dFTT1KAmb
	y5bJbj61jHcfN/9EYJ5ZScs97w3F474gRkWvlE+m16mmWx0U9pQTJrGuWonpWghlqaB0hq/RbvZ
	xAdLDCphjPkK31KFSEUN2sPDR4Y393fdcbHVvDSqbnkEx2av8w+6xFn6qnGvlsBP3P0wqfg==
X-Gm-Gg: ASbGnct7IM4LOQbHbBeQLgmFOp7c/lo2OaClm2I6BdSl7qmQKixsvqAlPfmkyOUyjXY
	xeuvMBtt69RiDB1m5Nx6Oco0SHOW3dow9CaLBkL2shK3IfYEd/tEt4PHdpLAYi0w6fOd+2YqsBr
	MPpPLc1C2TOdceqjFKo+NK7OpNX82S+zrhGOSSG2ajPUAgvdMOg1NX26GEsw2qT3tSsbCbny1UR
	BqEIlc7yKduLuOvyfbo3F4kXEPWq16D/+LYQgWWVusGoZuy7oTc22SsyKC/H/Me5Ui+OsYFhs4s
	3hATn9VoU8EGEOD8xqXtuZtvyExk3IYNYmyKiXVS+O2YuQMBhc+Ii+qO9yA+v+ApKgA6ih51tg=
	=
X-Received: by 2002:a17:902:f70d:b0:248:d917:a57c with SMTP id d9443c01a7336-24944ad11e1mr272852145ad.40.1756981019642;
        Thu, 04 Sep 2025 03:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF62jdk6gndKp8OgF73KFyvJIMRCikJPPEDPzJaEVOadSZ9EtTIxaw+Nb5rGXP78fAdDW33dA==
X-Received: by 2002:a17:902:f70d:b0:248:d917:a57c with SMTP id d9443c01a7336-24944ad11e1mr272851775ad.40.1756981019086;
        Thu, 04 Sep 2025 03:16:59 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc91987f4sm14453055ad.33.2025.09.04.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:16:58 -0700 (PDT)
Date: Thu, 4 Sep 2025 15:46:52 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add binding for gunyah watchdog
Message-ID: <5210a5e2-0d75-4532-b3ca-1cbdf8ea2a9e@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com>
 <ea295ff6-5395-4470-afc2-76e5e2dc9fb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea295ff6-5395-4470-afc2-76e5e2dc9fb5@kernel.org>
X-Proofpoint-ORIG-GUID: EKkFPIUVnL7Em1lT8JdMo0Kl8XbKT7AY
X-Proofpoint-GUID: EKkFPIUVnL7Em1lT8JdMo0Kl8XbKT7AY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX04jNsQkrDUnE
 IEpfFt0hsOJZXGzEbMM7eAqUjdO+qOc/aOWYTr644c+a9L4C8IwVS7llOnsJUiyzHVzTYYGRMt9
 zrZmkWpq4jAfuFi0RLc2mr5VzYol4aSdW7DA98/9l1L3efN9J5+OhOTzKUEc8LSkChhFzwYZzaM
 wYxsTXVXaq5vAdZAhbpZ8jDyDWxgLdIXcw6GCDuXmF8ZWVmSmeO7g2nH5toWnkVBLipnpz+DXwx
 eraZUtV24LdDdJDX20Y2K9q1UEoqdBBHfws6EsEGuqpzS/VBU4hH2wfZXCm/ZFoKj6FJoCHzWQ8
 33fRUNyjujadRbGzeckqraL6LrvnWlwh/fXHObqkDlZAhB1FoeHfIk3QOFbAzbJXnGh8XnJg2cY
 IU7mTrw/
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b9671f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=oqeMfTGgUyYRHvyDDiUA:9
 a=CjuIK1q_8ugA:10 a=i6qsmYmKKdoA:10 a=csto0wWSG80A:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Thu, Sep 04, 2025 at 11:52:32AM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2025 21:33, Hrishabh Rajput via B4 Relay wrote:
> > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > 
> > The Gunyah Hypervisor applies a devicetree overlay providing the
> > pretimeout interrupt for the Gunyah Watchdog that it will be using to
> > notify watchdog's pretimeout event. Add the DT bindings that Gunyah
> > adheres to for the hypervisor and watchdog.
> 
> Wasn't tested, so limited review.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> 
> > 
> > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > ---
> >  .../bindings/watchdog/qcom,gh-watchdog.yaml        | 76 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 77 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
> > new file mode 100644
> > index 000000000000..bde8438c6242
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/qcom,gh-watchdog.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Gunyah Virtual Watchdog
> > +
> > +maintainers:
> > +  - Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > +
> > +description: |+
> > +  The Gunyah Hypervisor provides an SMC-based watchdog interface for its virtual
> > +  machines. The virtual machines use this information to determine the
> > +  pretimeout IRQ which the hypervisor will be using to communicate pretimeout
> > +  event.
> > +  See also: [1]
> > +
> > +  [1]: https://github.com/quic/gunyah-resource-manager/blob/1b23ceb0dfa010b3b6b5a5f7a4ec1e95b93ab99d/src/vm_creation/dto_construct.c#L519
> > +
> > +properties:
> > +  compatible:
> > +    allOf:
> > +      - const: gunyah-hypervisor
> > +      - const: simple-bus
> 
> What? No.
> 
> Don't create patches with AI.
> 
I am next to Hrishabh when he is writing this patch. I can confirm he
did not use AI :-) not sure what tool Krzysztof is using to catch
patches being written with AI, that tool needs some improvement for
sure. 

I will let Hrishabh share why he put simple-bus here.

Thanks,
Pavan

