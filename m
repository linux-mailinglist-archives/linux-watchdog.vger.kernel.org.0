Return-Path: <linux-watchdog+bounces-2456-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 043529D3301
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 05:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B20EB1F23A45
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 04:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD04D15623A;
	Wed, 20 Nov 2024 04:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="NvXLS/23"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA3042AAB;
	Wed, 20 Nov 2024 04:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732078465; cv=none; b=eLmaJw1KKuVzsS1hS8waPvfmAlZKxKg0wcGDvmf1Td8ZNUTm6uB2rzII9fcxT/MqdItn70qE9VEkvhGdPW3RKhNlc0Xh0K6x2sS6G3kpC+w8hyUvGyy2L60s6rFEAI4HViK0/aLebXWSiPe2s7vYrABgZWKO4v7pYurUnXT1Ymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732078465; c=relaxed/simple;
	bh=m0rejVzUQ8KWXV5movCkOFjMtx+/Mx0idUJFVHrt9mc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=keuXhO/FcTEpldGiD5gqROASCgcP7nKlFMNROP2BrLfW6DXS/fo7CCSESNpZT5vHJaF7bnFKr5Wgbg2vb51DvTRAgvHG6u+z7ov386hjL9V9Cee+3JPTjHYYf4sOHprhzSYJ8WrnN30sUUfEaw0J9wbSJjCa5xV5MiG14M2ahmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=NvXLS/23; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732078461;
	bh=m0rejVzUQ8KWXV5movCkOFjMtx+/Mx0idUJFVHrt9mc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NvXLS/23phZOX0oazXs4Xv1vRCgMfkzmxFiB2ptYRe7mgYNjLB+TA0uCUFMX3lLt0
	 OdWVhkBFqcddqEvt0LlVxkQKBwKzKGDLyAGbg1UAww346BcgXd7qG/6KHHdeO4ybza
	 Zj3pDAQiZ9KF3qsFAFEp46bpmY2+rQIq7Jvk5SihOKZEEDcnz4ebdfw0jHkb+a44ON
	 cMjJ7xFGrTa1NblXj0zmPI/zgfoLxjKj+axuEaCzOGUIXeiIKimOLX0kL8+a/oLxXi
	 jPXESR1UDnEITr7oNggg5/MSGOLEk3fiXM8s2krf4/Cn5H5Q8AK5sKcQ6b2mJuW+mY
	 CKvW8eYkKhmsw==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9637766403;
	Wed, 20 Nov 2024 12:54:19 +0800 (AWST)
Message-ID: <1bc83ee73545f9aab6e0a931cda8f5ffe41cb445.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>, Patrick Williams <patrick@stwcx.xyz>, 
	"wim@linux-watchdog.org"
	 <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
 <linux-watchdog@vger.kernel.org>, "Peter.Yin@quantatw.com"
 <Peter.Yin@quantatw.com>, "Patrick_NC_Lin@wiwynn.com"
 <Patrick_NC_Lin@wiwynn.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
  "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, BMC-SW
 <BMC-SW@aspeedtech.com>,  "chnguyen@amperecomputing.com"
 <chnguyen@amperecomputing.com>
Date: Wed, 20 Nov 2024 15:24:18 +1030
In-Reply-To: <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
	 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
	 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
	 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
	 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
	 <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
	 <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-11-18 at 17:27 -0800, Guenter Roeck wrote:
> So, again, what exactly would userspace do with the information that
> this
> was a watchdog triggered warm reboot ? Why would it need that
> information ?

I'll defer to the others on To/Cc to answer that.

My only position is I don't think changing behaviour of existing
drivers to exploit WDIOF_EXTERN1 as a graceful-reboot indicator is a
good idea either. Obviously I don't have much skin in the game with
watchdog maintenance, so my thoughts shouldn't have much influence
beyond the Aspeed-specifics, but I just didn't want to see some fun new
confusion or incompatibility arise as a result.

Andrew

