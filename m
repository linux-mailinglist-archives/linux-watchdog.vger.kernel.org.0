Return-Path: <linux-watchdog+bounces-4726-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111FCD6EA4
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Dec 2025 20:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3143011426
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Dec 2025 19:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49172337B8B;
	Mon, 22 Dec 2025 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lJ6IpMax"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F347326D63
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Dec 2025 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430195; cv=none; b=kVTOPt09nMWmsMtaJKXvW/cWT9kBTGWyII82WjDU/bq5N8gIbbdm9c7+IBfDsaLg8jzvoVrqT/L0a507YQuADUYI3jZVfNipysWvnM8ixssjZEz6GJVxpe+EujDKwOv9WKnBo93uNqXdlxJrZem33cQzBSTRijpYisuXAIyLP2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430195; c=relaxed/simple;
	bh=PaF7GyI4rezprjUtIYvkxxp0xmLg4R6QoreSIahZw+A=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QItDlu9lMX6seGKL1nORC/RWBD7pnTe17D6sEhq2OkToK/Byh7oxHBnMnUOhargEsyCdxP4pp2KbcHhAyOPniCY1T//BpxwaepwliZcI97k/T4PRDXPxbYzIw8mRTxKGWVaDDQIDJDc9n5yzKwk4qG3FpojUHY4E76+/Op0crGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lJ6IpMax; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1766430183; x=1766689383;
	bh=PaF7GyI4rezprjUtIYvkxxp0xmLg4R6QoreSIahZw+A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lJ6IpMaxuhkaRcR6shvwPCYk2EmxuWU1PfrRm1BmVc3ef+H1r5Gxm2D6uJNnbuUez
	 NQjF3UY1fiRQun6SRo6oL8wGPggnMDgMPo51G38s8rY59FQxv/pN47JMBkUYnl3mLl
	 EAKM5nRwtDi1i7jYQt9WF7d1S79tUQZbAgB1y7QggC8buPQDDLG9LaOFfp6FSwcqc4
	 QxXLe9bTshiIzLPF5bgKW5v5jhB2sSVe7KzHmpM36ydkdWFaygCCbHWPIV+xJLjpqS
	 tJxWuQgbwkHdvEYD21JHj0tzUuFta1AD5MoIeA5cnR2S/BLV/ekakFY1UvV2HVvKbb
	 Du/FvRI8u3KCw==
Date: Mon, 22 Dec 2025 19:02:58 +0000
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ac44ac6cdc9c89879847125c5270ee70225b687f
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 9/4/25 1:05 PM, Pavan Kondeti wrote:
> Thanks for asking this question. I believe the overlay part needs some
> discussion here.
>
> I have tried this series on 8550 MTP. The overlay failed, so watchdog
> device did not probe. same is the case with 8750 too. It works only
> after applying this patch. I will test and report my observation on 8650
> later.

Hi Pavan, was linked this thread after seeing what I think to be the=20
same issue on another platform,
but issue is a bit more serious here since bootloader fails to find a=20
DTB at all, not just overlay fails.
When the "arch_timer" label is missing from the base DTB on Milos,=20
ufdt_apply_overlay in bootloader
will fail and it looks like the DTB memory gets corrupted. If you are=20
booting without a dtbo image,
then you don't see the issue. Couple logs from bootloader when it happens:

 =C2=A0 =C2=A0 ApplyOverlay: ufdt apply overlay failed
 =C2=A0 =C2=A0 Error: Dtb overlay failed

After this happens, the DTB memory seems to get corrupted:

 =C2=A0 =C2=A0 ERROR: Invalid device tree header ...
 =C2=A0 =C2=A0 Device Tree update failed Status:Not Found

But it doesn't seem to have anything to do with the DTBO image itself=20
(despite only happening with one),
as it happens even the dtbo is effectively empty with the exception of a=20
dummy fixups so the old version
of libufdt in bootloader doesn't fail.

This seems to have only started happening on recent versions of the=20
proprietary hypervisor (don't see any
dtb handling in https://github.com/quic/gunyah-hypervisor), since I=20
don't see the same issue on Blair but I
do on Milos.

Should the label be applied to all QCOM platforms that have a timer node=20
to prevent the issue from appearing
elsewhere? It looks like it's already applied to lemans & sm6150.

Thanks,
Alex



