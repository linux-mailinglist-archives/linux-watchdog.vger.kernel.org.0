Return-Path: <linux-watchdog+bounces-2357-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF89B2CB4
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 11:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E3C528114E
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 10:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC151D47BC;
	Mon, 28 Oct 2024 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOgZklpm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACD91D47AC
	for <linux-watchdog@vger.kernel.org>; Mon, 28 Oct 2024 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110936; cv=none; b=MxF7qsbREipVLDw2zY9l6eBxqp8PUOTMg5mKAzh+xTROe5rZTMsDaejnr5E9HWp8Xkc4BH/TBI6ZGS7Jnr4l6zlgBa2ieQ/STU7T6aZWsBwN8BdhRsnsF0pGv+sCfIVFfZYmtoKj8CinBuS0nxFvjRhzIhrVQB5gCRzUW9GwGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110936; c=relaxed/simple;
	bh=j+BzI74zx8wGhWna04Y/zOpDOTV07gvAuCwfKzcB5Zk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qr9nrcSOEKrQB9h1qMmD7+ENh0MX30Rd5p1wEplwlJ1djZmtmnKFGn1GibS6ttJMgbhXOdVBR6GLXFl+PDIaTa+60Fg8jQ2/3DE4aXmwbHv0i3enqTXJX/NetM5V0e10Dsc2sSUd3GvLFGyT576mnyFR5P+RABV9lX/XlrG4/K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOgZklpm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA644C4CEE4;
	Mon, 28 Oct 2024 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730110935;
	bh=j+BzI74zx8wGhWna04Y/zOpDOTV07gvAuCwfKzcB5Zk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tOgZklpm4yBEFypetxsi/9WsC1GvbpvGpTutm8XVtGiT7IrEYHdhZWFdX4KvpuwJG
	 0C2EOIcXGE8pDW6np3zCYq7LwEfCsKTYv6X+WvSEMoeglpCKMWL3P9cmL9fk63pK3n
	 xFYNjQaw9ZHs9R/v+jBAnnOxPiwLjxd5gJM2mekcEWquW9oVOOxAeAk+JFEgTapAhu
	 cydshbOzEk5mqiZv8xjenME6Me9bwGrC2a1kNIgg+RpzblSlqJYtQLmWrPnFQESb7a
	 Akkxx5LP5U+Z7j1LGdteY/G4abIaqS70avctcqKXoBWXVPRiR/8cV7bIfr1WqOjsZr
	 SioRSGSSIkuGQ==
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id A2A831200043;
	Mon, 28 Oct 2024 06:22:14 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 28 Oct 2024 06:22:14 -0400
X-ME-Sender: <xms:1mUfZ7VC_Z2q7gUIjT0iD4Tme7xLSeA5h2JwFvBJd6yiUYNARZKwcQ>
    <xme:1mUfZzkhlos7N77TrD7v8n6OjKW7mHiY1UBisOIgWCPK34KZG_H6IuBigdrIP7VGp
    -yPAUXvkKZwJxzO5Cs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejkedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlh
    drohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteefteekieejudeguedvgfeffeei
    tdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrd
    horhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepfihimheslhhinhhugidqfigrthgthhguohhgrdhorhhgpdhrtg
    hpthhtohepshgthhhnvghllhgvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtohep
    lhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigr
    thgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1mUfZ3azsVaR0rd6cg1YgmWUEY1S1CuTPs75uT79Ho-1o76R81hyKA>
    <xmx:1mUfZ2XZkJqco_3KuwtD5_JSRIcHtT-_p27mD7SC7IWqaug2nYCPcw>
    <xmx:1mUfZ1kSXS4g6_0m3YW9Jflt9IubwmdMMb37yVF-s9QUqVs5RCufTA>
    <xmx:1mUfZzdiD_V8CCivPV6KlQhXgSa4eXL85Ju5nekhzPS1hIG_HgLtRA>
    <xmx:1mUfZ_HMG9l2BfzQslx_7CeWPEHFGlDJLNjZ6MPMMNrcTjCEeSrOJWtY>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6F5B42220071; Mon, 28 Oct 2024 06:22:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 10:21:42 +0000
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <3b12e20d-a299-4e82-a92c-cb3a68e60eb1@app.fastmail.com>
In-Reply-To: <20241014-watchdog_sbc_ioport-v1-1-896ccf311839@linux.ibm.com>
References: <20241014-watchdog_sbc_ioport-v1-1-896ccf311839@linux.ibm.com>
Subject: Re: [PATCH] watchdog: Add HAS_IOPORT dependency for SBC8360 and SBC7240
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 14, 2024, at 11:25, Niklas Schnelle wrote:
> Both drivers use I/O port accesses without declaring a dependency on
> CONFIG_HAS_IOPORT. For sbc8360_wdt this causes a compile error on UML
> once inb()/outb() helpers become conditional.
>
> For sbc7240_wdt this causes no such errors with UML because this driver
> depends on both x86_32 and !UML. Nevertheless add HAS_IOPORT as
> a dependency for both drivers to be explicit and drop the !UML
> dependency for sbc7240_wdt as it is now redundant since UML implies no
> HAS_IOPORT.
>
> Fixes: 52df67b6b313 ("watchdog: add HAS_IOPORT dependencies")
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

I applied this to the asm-generic tree as well now, seeing that
it was not part of the HAS_IOPORT series but is required for UML.

      Arnd

