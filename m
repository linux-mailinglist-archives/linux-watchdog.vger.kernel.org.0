Return-Path: <linux-watchdog+bounces-4808-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FAD19BC6
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 16:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 359B4303BFBF
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jan 2026 15:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2981830E0D1;
	Tue, 13 Jan 2026 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aAkIdK25"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11891313E30
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Jan 2026 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316848; cv=none; b=flZ8UFvb6xuAv+Vh9DZUVFfyLF9buhNfYAVpW3FDwaU5SDGIqJ9QYz9KN6vnmoAEzW/9zYXhU73baZuPiGmg5UShMovUx7I1CyyCj2gxCfTGMAlqoLG+4B2Mku8D8GJuXJ7w3lZxSe23bAGzQEbmAluzNKfTe2hOOQ08j8pUf5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316848; c=relaxed/simple;
	bh=aThNGjTBNgO51mbqH9WUWWw8yriA/DqkYmAuwRaxee8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZGwCaNiEF5O0ekBY2eVzOnckMxJiIaS79PpRO5QaIKvUatlSHV2EOKdii6aDV8uUwGiLUmSSi+D8pUt0EMS20ehv6ZVZK4GP28uNWkIQ7AxtUiqII6J2L7QrSKWNq5JAS9S3ImC3tgI3a/HiiTug6qFgdYQOpQQCTawq2DbXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aAkIdK25; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768316843; x=1768576043;
	bh=aThNGjTBNgO51mbqH9WUWWw8yriA/DqkYmAuwRaxee8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aAkIdK25BT3Pgr93W/+mSYasIGDE4kvJbhnh6eZBApn7/fF3e4dLH28hFd1Wq6j+S
	 w2IyL6r4XEG5A1h59eNYZg7Q6FyleVqJj5auzzzyi4kgjrfnNvPrE3NKdR+OzEO+ih
	 0qQjgbM5+lNBx6lngE9CmmPXx7+x7vnX+Jh6AMCZM0lvKv3JOLnJyyYB81mk3TMCfA
	 A022/iUrbLct1HVXzpJ5tHDDmmUEtHBUOlheKQ58Qvuk9ExQp0ruqDVfXfoOpSqxGn
	 i6zA45VjZBLQbtfMoPsOOkQOSf2lfCplJGthTcc8/EqI+35pxa22pmz/2dLNEatiz4
	 J/n57KALelrIA==
Date: Tue, 13 Jan 2026 15:07:20 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <pquvJnlBgedyrF5RUTrHBUoqCIR7sQMWjwvcpm-5MuqAOxcbLg7i4H2RkuI27usOGZO000h3c90TM_kr6c5UFfViPCzGXX5MNWKFHugevXE=@pm.me>
In-Reply-To: <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com>
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me> <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com> <ABmlNqg6uJXJLkDZo3uaZLdrTCFIjRXOJ68Hrx1MnHHYMnPJ9_g7GW0HGRhZBKv4--_PANfXgTV7h-n7HFC51zKNW6JkmEhpB6_EhFQ27Rw=@pm.me> <ee448445-8a6e-40ea-9464-1c2ae52b84cd@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e48a1256c62ae53081944281cdd61ffda019514f
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 13th, 2026 at 9:50 AM, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:

> What I had in mind is that with the sources you can track down where
> the issue comes from with a fair degree of confidence.. if that's a
> Fairphone-specific issue, maybe you could prettyplease ask these folks
> for a BL update somewhere down the line
>=20
> If you still come to a conclusion that the hyp is wrong, we can accept
> that workaround..

To clarify the device I'm seeing the issue on is the Nothing Phone 3a which=
 is another milos device.

Not sure if this affects the FP6 as well but issue was also seen on an 8550=
 platform, so seems to have the potential to affect anything 8550+ at least=
:
https://gitlab.incom.co/cm-ayn/android_kernel_ayn_kernel/-/commit/7ae656510=
8654991aaac9b73a2221509511e59d3

It's not that I think hyp is wrong, what I'm guessing is it's a bug in boot=
loader exposed by a change in hyp dtb (since it doesn't affect blair on sam=
e abl tag). If that's the case is it still acceptable to workaround?

For the majority of devices on the market you can't really update bootloade=
r, it's signed by the OEM and sending a support ticket about it probably wo=
n't go anywhere since it doesn't affect downstream (since it has the label)=
.

Thanks,
Alex

