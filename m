Return-Path: <linux-watchdog+bounces-4755-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0B2CF6432
	for <lists+linux-watchdog@lfdr.de>; Tue, 06 Jan 2026 02:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E72A63024249
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Jan 2026 01:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3186B29CE9;
	Tue,  6 Jan 2026 01:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TSC2nlgN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD47640E;
	Tue,  6 Jan 2026 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767662978; cv=none; b=u54CE9+Pl2HibLAmO1hBou8pg2IGAMuWFGtihOoIX+lRV2hsMIeTVhC3jVnPzOlODtYzLpf9iGqIqlkMu1q/tNSfTeFxVphKKH0yfv80cZU3W+S+gCI+ozlFW08JPZSmYBLTOvlx+Dut0wMxWDJZTG0qrxFf/qaYxSIM3dtas4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767662978; c=relaxed/simple;
	bh=BOcCNMp1INqjcXwIO4bDUoob4UpdQuZ592biX8sY/Aw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MH1ShLMvo288FGObg/WI9Bzc7zolpjhZcQWcDznb/WR2mBVku6vp1L06bhPyu4qYAa493XI4MhIikU71bo2ADF8awI9JscQGWreEgSmZdEbjmiofz0eg3Ou1EUBiG2hKsqNHKCfvjCVsbBK2nri3jeFzS+6U57QWGbABKPL8avk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TSC2nlgN; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1767662967; x=1767922167;
	bh=4uzkSMQRSAW1nzDN/n5W806VDwJ13cISuBlGwWWQkLY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TSC2nlgNyplw+OmXAPsM91lKCJhKyQCqgTI1zY6qd+xV05HxQOc5AJc6aB9Eg8iUy
	 r2KS1yDgN0I5GvoP7Za9n+2mxlLoSQrD8R/5+iEF0fxknMQ2W28Jqq9P2ZOQAUTxre
	 1pp17lVBor9h7f0jiA1ms92U62YCnmqO+eCKIfzKKDvx19yF8JrWETKcxzjGl0GQhY
	 BdB+YmPJbW47jlD9LaZiv8XlYK/S8opI4FMkNvEyBAmBuHMJKc96CTx397vItoQ6Ht
	 UVelqv771clcHZM9NE6FBJM6q+MxxzgLhUzDY1JYHGTQNTKFzt/qwBj/qZon5I99be
	 YLwmNcqIqxYvg==
Date: Tue, 06 Jan 2026 01:29:25 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me>
In-Reply-To: <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me> <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8b02b851afc68cfce49efce818cc7f562f6297d6
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Konrad,

My device's EDK2 should be on 'KERNEL.PLATFORM.3.0.r1-12700-kernel.0', unfo=
rtunately the device I'm working with is secure boot on so I can't modify b=
ootloader to resolve this issue, though I'm not really sure why it's happen=
ing when I looked at BootLinux. It seems the hyp dtb handling is the same i=
n both the "dtbo img valid" and "dtbo img invalid" cases, so not sure how i=
t's only happening in the latter case.

Note, that I do have a blair secure boot off device that I flashed with  th=
e same tag (KERNEL.PLATFORM.3.0.r1-12700-kernel.0) since I noticed it happe=
ned to support the chipset, but was unable to reproduce the issue there, DT=
BO gets applied even with a basically empty base DTB. Guessing it may be du=
e to some change in hyp with recent SoCs.

Alex

On Tuesday, December 23rd, 2025 at 12:50 PM, Konrad Dybcio <konrad.dybcio@o=
ss.qualcomm.com> wrote:

>
>
> On 12/22/25 8:02 PM, Alexander Koskovich wrote:
>
> > On 9/4/25 1:05 PM, Pavan Kondeti wrote:
> >
> > > Thanks for asking this question. I believe the overlay part needs som=
e
> > > discussion here.
> > >
> > > I have tried this series on 8550 MTP. The overlay failed, so watchdog
> > > device did not probe. same is the case with 8750 too. It works only
> > > after applying this patch. I will test and report my observation on 8=
650
> > > later.
> >
> > Hi Pavan, was linked this thread after seeing what I think to be the
> > same issue on another platform,
> > but issue is a bit more serious here since bootloader fails to find a
> > DTB at all, not just overlay fails.
> > When the "arch_timer" label is missing from the base DTB on Milos,
> > ufdt_apply_overlay in bootloader
> > will fail and it looks like the DTB memory gets corrupted. If you are
> > booting without a dtbo image,
> > then you don't see the issue. Couple logs from bootloader when it happe=
ns:
> >
> > ApplyOverlay: ufdt apply overlay failed
>
>
> FWIW this comes from ABL, which is open source
>
> https://git.codelinaro.org/clo/la/abl/tianocore/edk2/
>
> You can probably deduce the correct tag from the boot logs
>
> Konrad

