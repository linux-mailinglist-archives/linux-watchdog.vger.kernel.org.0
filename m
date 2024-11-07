Return-Path: <linux-watchdog+bounces-2432-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8D79C051E
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 13:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A9D1F222AB
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 12:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9601FF059;
	Thu,  7 Nov 2024 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="AkgDiDNp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793281DE8A4;
	Thu,  7 Nov 2024 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980851; cv=none; b=TgljchSU5g9r8OfHpF1bR/3uuGQFhXWJ4ql7tboqnNoo2U8DZQD/+878F98WFTr9y86+ZZCzH1pi6xqQ3NmeTEwGVGxpXJMWK0WgQvzgddmznCRCA6+LpYSowSWcSQS/OX8aP/AL0VG11QO587XQjc7gkpXPeEtjIGGB9p3ilR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980851; c=relaxed/simple;
	bh=uMm7eWhg5zxwjiJM+lslSNcWxvKbHa1oHkkgaXf1Ha4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfqIGmzimzBbC2/ihG6O0yAehr2VYoScLCrDIaXJvytydd8TtxnO/5/QWYRB/8q5b7SCVDhWOmMHyphIyqryeKb6/Q4Nm/vmXo0FSFAxsrxQttz0q0ypdbkdWujke5S1aQU0id2x6hJL0TDFjwyXy+ltCMJxl2DFDYxkiEB5GQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=AkgDiDNp; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id D076C40A06; Thu,  7 Nov 2024 12:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org D076C40A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730979206;
	bh=uMm7eWhg5zxwjiJM+lslSNcWxvKbHa1oHkkgaXf1Ha4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkgDiDNpn7Kzfmt28t44X/BKrVl/jNC32/Iuk2YdqhcUbXdwj9wyZKo5SWY40Nbsv
	 l5VY0SruRwW5o8cFrBumW5cMJvrEHhhloYCUmam74ZNHU8TiYuheZw99swUYGHLbQ/
	 ZtuYbDdokTE0kuGPZRSi7z3+thKl6ZxUzyTwdwSw=
Date: Thu, 7 Nov 2024 12:33:25 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Taewan Kim <trunixs.kim@samsung.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Byoungtae Cho <bt.cho@samsung.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: exynosautov920: add watchdog DT node
Message-ID: <20241107113325.GA5284@www.linux-watchdog.org>
References: <20241021063903.793166-1-trunixs.kim@samsung.com>
 <CGME20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc@epcas2p1.samsung.com>
 <20241021063903.793166-4-trunixs.kim@samsung.com>
 <961e1aca-cd90-4db1-87d7-afd2e542421e@kernel.org>
 <20241107103331.GA4818@www.linux-watchdog.org>
 <589c40e1-6a1c-4ef7-b0d8-b761b132578a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <589c40e1-6a1c-4ef7-b0d8-b761b132578a@kernel.org>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Krzystof,

> On 07/11/2024 11:33, Wim Van Sebroeck wrote:
> > Hi Krzystof,
> > 
> >> On 21/10/2024 08:39, Taewan Kim wrote:
> >>> From: Byoungtae Cho <bt.cho@samsung.com>
> >>>
> >>> Adds two watchdog devices for ExynosAutoV920 SoC.
> >>>
> >>> Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
> >>> Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
> >>> ---
> >>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
> >>>  1 file changed, 20 insertions(+)
> >>
> >> How did this happen that this patch was taken to watchdog? There is no
> >> Ack here from me.
> >>
> >> Drop this patch from watchdog, I do no agree to take it via that tree.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > Seems like you are having a hard day. 
> > The 3 patches are dropped. I presume that you will take them all through your tree then?
> 
> I meant only this one patch, not entire patchset. The bindings and
> watchdog driver are for you. I commented only about this patch here - DTS.
> 
> 
> Best regards,
> Krzysztof
> 

I added the first two patches again. Even when it sounds more logical to me to keep the 3 together. But that's a never ending discussion, so we won't go into that :-).

Kind regards,
Wim.


