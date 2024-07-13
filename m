Return-Path: <linux-watchdog+bounces-1376-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43D93053F
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Jul 2024 12:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE841C20FB1
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Jul 2024 10:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D976A5A4D5;
	Sat, 13 Jul 2024 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="K26DenVp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CF747A53;
	Sat, 13 Jul 2024 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720867666; cv=none; b=cNQJEWG93O9ph2MVQBtthuNk4NFv7XIXoL2jZFXQ81MedbOLHL+nas3tQo8h8IQb+C/Sq/wtwX7FxsbJEl5z1d+8Li7LsUzsrdSfKhAO7/HjLn6ebX3KoBjb83W1lWwBq3e9TexdmyoysH7mC/Xe1Pk6mGmnXOLnFeLCu/a35NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720867666; c=relaxed/simple;
	bh=6Rd/PEeMiqexHiwaSOQ1xuaoeBDAi/qd5v9AWNzziaQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=J2aJwoCrE+zo/QYQn+gzQGLlNCJffuiqGJQfCfV+7NnwXF+NOREAWXxSwDjE0xmEb93Daq2GbfR0KOWglFFSTjMRDBoIRaXZZ1aeJulRuFdAF1M+LDAlCMQ1wNJt/RR5a4uFmZwuuyrUw3ImQ2ePoHxt1erjFkHrvxAl4V/rFcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=K26DenVp; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1720867623; x=1721472423; i=frank-w@public-files.de;
	bh=6Rd/PEeMiqexHiwaSOQ1xuaoeBDAi/qd5v9AWNzziaQ=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=K26DenVpAOM12XFxLVW2HTOzeEb9UP9Wopq+Zd+I3K0jsuybfB9ZPx5BthXcR6+t
	 0z8fu6N+k5+zKeHNxNuCh5WpD5trpFLbDRJeVTkhSC/f6nbHTneO4Rcyt3IieKo1z
	 BJNw60T10sZ1lHtXQkiWUe80Y/4Lem97Sfpf35Ls1u/n8GjZBADVGajbqbFnp+ANm
	 8dPbmv6WzVaxikP/sf3Bc7pfJQCEaLRN5DkMS/1+QmQ7WaC32cPcnKHNMOapB/HZ2
	 hrgCjn/PBs/qAaWNAKMQNuF1eJYwJete8TCONf7QfCKx9hn3dv8wi31NJRyl3Q1Tj
	 IegYx1yF9pvye2oiWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.145.51]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNY2-1rtWZq38Ma-00iLMZ; Sat, 13
 Jul 2024 12:47:02 +0200
Date: Sat, 13 Jul 2024 12:47:00 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
CC: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/4=5D_dt-bindings=3A_watchdog=3A_me?=
 =?US-ASCII?Q?diatek=2Cmtk-wdt=3A_add_MT7988_syscon_requirement?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <58cba30d-af53-47a6-9258-8b36eab6cbfb@kernel.org>
References: <20240709101328.102969-1-linux@fw-web.de> <20240709101328.102969-2-linux@fw-web.de> <58cba30d-af53-47a6-9258-8b36eab6cbfb@kernel.org>
Message-ID: <F5A59950-5D16-4780-A64C-806A6324D467@public-files.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dfQVnBpIteXjdR8ttejmmx8V5KDS9dWqIXsSefOdM2sLE/Obzco
 NGDmA4NYZJB7TLC2wDsEaXEpgf6Xsx332EYdG0YfLBz0/8wsNk7+hpg4Itwu2I3DUCcOb0w
 msuBv+/Xb0nDwy+ySkjfwRlAToGV+uz3y5kI4J44Pkay2s66a7DBZI7b1JXLpsZapc5cAW0
 dxdy9GJLKI/j6SjG0lDkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7d5/pH8sfOY=;kZxM77vMuE7lzEFRj2it8hMElOb
 XfUwf6PpqfVT6w35/xDyxLXkd35plIy0+Ix3IXfqwLS8q67xbsOjI2UEmx4Q01LoOhF+1d25e
 t1wbbK1QfPNMrMMwDYKayZcNi5nmZqHQjFktyMYC4KhTxI9hRT0DhO4bn5g/tGEqAMFGOcmgY
 Sulc9zWvKtnkX4G5oL/FceF6nm4/joU9GzZo6XqBzClqoq3kkKtrLTtIofPvPBwhYipdn8HB6
 ZtIs9TZwqyByvlSrk/kLn1HJRQyXfoSeYsPA5YsQ4It0wIIpY7MQOC7rsFp/103FEgayRYik2
 h6GKbWQrRv2jaU00V45KtiVVvUXtY4sMQD66tF3C9VrSBVvQzSDSzSVZ0IBzJNfYETB6I1YFC
 8t60Wu+ms6rM+TF8L1AYT5GyFAwXhZkfjpK4Uqs9ZgEFY5MyQmKRn3DF3u++8mY+9zJ11/ylw
 W9Z01g4C4STe2483/xiUV3FBps2s2cL3pKgH9XKBtMAXGHB+FUgSk2iDPmLHZ53ZbCNzsNcAY
 MP77ljfHtbwC60yPXReUmOxZMHFhb3j1DP5T0ivfrtSKeJ2CMm+QcLG1B2xXk82ed0jb2OtAY
 eqIqhU3gch1KgXPpwVl3ZTNRJF4EGDQrRt9/BGHhyDiVHFDLNdf1wzgqO49zVpdzV7bEo1O79
 9gqvnb3z8tph1gI2uCwLtPizYyl4gCyeRBzITWzgSkEXXsy18ytGV1uZBf1erunhQXdKePRHB
 EIrompkqsMh3FSLQyfP8eUKENAH5Ju+yhDvbsKgZJiyiDd3yD/hhSK8mdebk+Ji5mz6qaXzWR
 hNM+bQeiUUEaJILs+UEYi5/g==

Am 13=2E Juli 2024 12:21:46 MESZ schrieb Krzysztof Kozlowski <krzk@kernel=
=2Eorg>:
>On 09/07/2024 12:13, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> This is needed by u-boot-driver when using OF_UPSTREAM=2E
>
>Thanks for providing context=2E What we miss here still, is the
>description of the hardware and for what this syscon is used=2E Why this
>become system controller and before was not? Or this is just for regmap
>- then it does not work that way=2E=2E=2E You cannot have whatever driver
>poking all around then claim - I have crappy driver poking to every
>driver without implementing proper driver model, so I add syscon to
>bindings=2E
>
>
>
>Best regards,
>Krzysztof
>

The nodes here are linked to the ethernet-node and syscon is only needed t=
o get the regmap=2E=2E=2Ethe access to it is done by ethernet driver=2E It =
does work,but maybe not the right way=2E=2E=2E
regards Frank

