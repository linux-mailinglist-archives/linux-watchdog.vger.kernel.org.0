Return-Path: <linux-watchdog+bounces-4196-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E78B449F0
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 00:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5360B1C8776F
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 22:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179912ED16B;
	Thu,  4 Sep 2025 22:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gA2lXBAZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBDF273D6C;
	Thu,  4 Sep 2025 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026298; cv=none; b=HgeulfPwwFiE2lLZXBjujuxHu5CCI2mVyDLHmuDOi5GS4HU2zpmLsRjjlqtCCVPzD6ocIJVa2GPHo0ux4xVLHWHg7X1CcdkYo53hLmpIsEbGWGyU8x4dFY/QOA1fuZ0l1XQOjMUWJIgLw2CpRKUtt2jvrf9ls2OPoRWkEcHvtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026298; c=relaxed/simple;
	bh=rZxlIRFhfwXJ8Ey0B89TYPM99pCpKry9h4aA8gtZwaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dl+5VEqSoC6BB2trRKkDT4s1tFrN5XkRRc0wxXL27BRZRFKL8vs+6pcmSDZHjlvWAIZ+XcPqCn6cmTQEYGIl7D4iVe2TWZDpNVt9oyqNm0ARPkI3LSf7RWl1QfKiH8JyqrpdZcBIDsDPQL/Sg4w1t/0CcOp0c2WDHpyk9Mfp/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gA2lXBAZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E616C4CEF8;
	Thu,  4 Sep 2025 22:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757026297;
	bh=rZxlIRFhfwXJ8Ey0B89TYPM99pCpKry9h4aA8gtZwaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gA2lXBAZQ1c6we6EDVbvHv6Tj3+Hfno0ZMz/zM2ejt3eJ5dEaaTZoHJFmVacOx93F
	 7wvqVuFpmAQ0afNQh2bjNmZe4VhY0yx8zOKy0LNN/+l3vF42zYRxq9YIJuN1TQhL0p
	 B0O+EjG6SdOj6xMkvGympx4RwRwkoI8e6c8T4ZGGWiLK2gm1ZQxT0sLSjankSumcPH
	 RHxLXMe8vdBNBAwVQ3QvR5gSZLadOrg30fNzKVwCXOCAhV0qPE/mYYKnIwei4/NiEj
	 o0ZBIOkxnDPSbr/RkQlft3p8stLtSsvLMWRknu5WRAXNfykxjX0GeNq2XvViAn+mBC
	 Dea3uXCMNXr2g==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so2765660a12.3;
        Thu, 04 Sep 2025 15:51:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpxYeeQqTj7Ccw+hsY0iZxGBCsn2qog/RcqtuNx7lXN2yY8fnVs8Kce4l/T586fwus3rvqXA2AKUYo@vger.kernel.org, AJvYcCVsxyfoFkmM+8nWCiIjWtKASqs+fU40hdqvWqzrF5C85wksISUJ31Pao3p48t1esVxICXP3krn9PkIlCfo73Jg=@vger.kernel.org, AJvYcCWFU2J1uVzD3Xk3dqeyEbZWx3hZc2dQSWoEEknagl2ICRdpMmlL59r5kYb1UVBjU0bQCc80RvcpROlihRp22w==@vger.kernel.org, AJvYcCWWy9/JcyyoJnwjzsJ4INUbGDjEUyTRjrp8JerRxXLYTILU7X50nwpxSMkaHMr6ySRY+SBCawsCmIUexswi@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1WOkBcuT9gH/aDYeUYSedDrO39W3YPB285S3fYVlnXFUS3Q+
	0LK5mFkre3KKRQz9Wxt+wFBQub9Qs7RbSoEXxRV47kkWEhxqj5M76vGCdZwXv1EfRF7lW41Y78s
	l2I7FYcIF0mVYACTV0KajGvRHCjuUmQ==
X-Google-Smtp-Source: AGHT+IGaxOtL7PADVJ97dEblpUi1tzP0d34qEZbRrN12oBJr/y3CK4z9uDffSlyNPCZutOvejrHGmEfss/I3Efw3GWs=
X-Received: by 2002:a05:6402:3589:b0:620:a0ff:36b3 with SMTP id
 4fb4d7f45d1cf-620a0ff38d0mr2021228a12.8.1757026296065; Thu, 04 Sep 2025
 15:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org> <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
In-Reply-To: <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Sep 2025 17:51:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
X-Gm-Features: Ac12FXzkfB2c0iRpvpGj-xHclRNDJptX4X0vzi65Szyc16ZA5DCfpUwJ2Dn7HNY
Message-ID: <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 6:31=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/4/25 2:10 AM, Rob Herring wrote:
> > On Wed, Sep 03, 2025 at 07:33:58PM +0000, Hrishabh Rajput wrote:
> >> Gunyah is a Type-I hypervisor which was introduced in the patch series
> >> [1]. It is an open source hypervisor. The source repo is available at
> >> [2].
> >>
> >> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> >> access the MMIO watchdog. It either provides the fully emulated MMIO
> >> based watchdog interface or the SMC-based watchdog interface depending
> >> on the hypervisor configuration.
> >
> > EFI provides a standard watchdog interface. Why can't you use that?
>
> The use of UEFI at Qualcomm is not exactly what you would expect..
>
> >
> >> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> >> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> >
> > Is a watchdog really a hypervisor service? Couldn't a non-virtualized
> > OS want to call a watchdog (in secure mode) as well? But I don't know
> > how the SMCCC call space is divided up...
>
> Gunyah traps SMC calls and acts on a subset of them, passing others
> to TZ

My question was just whether it's the right call space to use. I would
think hypervisor calls would be things like "vm start" or "vm stop",
not something which in theory could be implemented without a
hypervisor in the middle.

> >> This patch series adds support for the SMC-based watchdog interface
> >> provided by the Gunyah Hypervisor. The driver supports start/stop
> >> operations, timeout and pretimeout configuration, pretimeout interrupt
> >> handling and system restart via watchdog.
> >
> > Shouldn't system restart be handled by PSCI?
>
> I believe the author is trying to say that the watchdog is not
> configurable from Linux at present, and if the platform hangs, there
> are some indeterminate default settings in place
>
> >
> > Why can't you probe by trying to see if watchdog smc call succeeds to
> > see if there is a watchdog? Then you don't need DT for it.
>
> There apparently isn't a good way to tell from a running system whether
> Gunyah is present, unless you make a smc call (which could in theory be
> parsed by something else, say a different hypervisor..), but then this
> patch only introduces the watchdog interface, without all the cruft that
> would actually let us identify the hypervisor, get its version ID and
> perform sanity checks..

IIRC, last time we got just a gunyah node. Now it's that plus a
watchdog. What's next? I'm not really a fan of $soc_vendor hypervisor
interfaces. I doubt anyone else is either. We have all sorts of
standard interfaces already between virtio, vfio, EFI, SCMI, PSCI,
etc. Can we please not abuse DT with $soc_vendor hypervisor devices.

Rob

