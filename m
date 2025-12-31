Return-Path: <linux-watchdog+bounces-4752-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606CCECAD3
	for <lists+linux-watchdog@lfdr.de>; Thu, 01 Jan 2026 00:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32297300F9F7
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Dec 2025 23:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C8B30FC00;
	Wed, 31 Dec 2025 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhNLG7KN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6D930F52B
	for <linux-watchdog@vger.kernel.org>; Wed, 31 Dec 2025 23:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767224482; cv=none; b=o2Z3z/igjJ2T2hnUOAjAolqmeTS+r34LJL/7k65H+/v41C5uUqlC9g95N17NrVgrqZrZtPLI71wv36SgBuKtb1UrkKONB7/qPQcs6Zn6UwWA67Hrx3TtDGceTgVbQiP1vkWjaU68EIhgbw4N1RIx7znFPFlkT4zTgen7BY7PC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767224482; c=relaxed/simple;
	bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/lyR2Xzbj4CZxFXCA/XPAU2wXmaGvOgwQKKbIVxPvqyA2hXqbsXtZA5Fz3qWIVfXcooNmkKu8rHjH4Wb1+v+NaL6bQhFwEDAG/8YLRGiIhnnPYC/28f4oy383tzpFn2kdBRho+nrB/mVIA6ZjjV9vjuv77Nsj5Cq4REcMdKj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhNLG7KN; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c3e921afad1so369811a12.1
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Dec 2025 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767224480; x=1767829280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
        b=nhNLG7KNf8ryHZsDsjazvvhjhrSK2fojkHdAZerUfZYxrEdshByrXlaaZ0AAGSAOvj
         oyESHjwZyipucGgaPE5q8fB0tUUZ29ov3ckVz6lpP5OTDFl5VF15FDlsoj7LI6bUNPrx
         VjY2oYxtJnPvmqkRi6/J0YiZn3nqwfqKrORxgdbxEIROWOou10nv5D4UJal9vxHckzSH
         2p+UR4KApM6J2n82Wlvb5m2G4LzYgLHQ/wr1Ftbef6s9xYyFKeJFp0d6VTTJzyT1UZsP
         2fOI8rbvlObGGgn1EutaEfAdjR5Hn++6FI9TXQDdpfEBXDg5E3l3qX30lsVt8V9I7pHr
         jguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767224480; x=1767829280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
        b=fKHu5YebMMqdzR2FMqg5nebMVmaDLGdPuIbTETBYiCxJ2IFY0hNURnLnn3EenbG2Xe
         NFMwFE2Q8Rwg25o6gapO0tY8j350ofd9U6HTRr8cDEyqbi+/z05V+nzSmGqE0HMo7mTR
         s9YKISaycs0L+6n7Qi9r9cVfIWpOQUCFepNaeOUYc0vjYOZsQBJj+YTnl1StLy1osFLB
         KKA10voxs/ntn7x4LzVid/VwAmbkDzLL87uomIAs4yP5vQnU26zSRkcuraynAFNlONb0
         7W7VsR06UVbGDd87ul1fPbigMF2VgHNS/QhA71g+S/5dVpF8kdJrH2W1Fa0RReG4PeYL
         S4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+MLlEhyj4MYV2a94mBan+5nopPEKgmR1vnInHMuvuqN5nCpwvd2wP/ODF66gLeWPqeNydWq6zIfeVFL4og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgh7rlwl569KIkGJO1xRzIlSAPyQD2bW4dTRr9N9bbQkpfCr9n
	eBFcSMRuotb2G+SY4fjymB+EgY+dvPEIS03nreUxI1xzHQXhodVGLhrD
X-Gm-Gg: AY/fxX6MMM3e+pCcvjn9jcOu6Mxutrv4LfLBU/sY8BHuY1sT9bdl2trMczT0ZSlibxw
	6fWNMxiugs3h0GrzgNv66FH7tHc/MoNh4tQKEYpefi2ocUAX/ndPo3v6+WvH3J4NtY9DgOYxNkw
	Jmo9878tgtiPtezdCNuTH/aeiGnl2rUTTstlMlodPVIPj55ZKSxlvB68mbtpUa5MNyE/45I1wMp
	nEDQF9vAqtmNb81Q5VoXppnbcjbfGHr2GeNGPgTK8MUbpf3rKQXyD0Ecxd/w3GTD3QTYi0LX8jY
	GjjLJGq7jZvxniywfMEcAj0BAQBe9tNIwaiQEYQcIYuizDYjnr36eA3KVzYI03olvSDIKXF2ZP0
	jOWxTFUjQd7BSMz30Av/NteeCKRWKfdl6f3KTtVLOoW5dtT0shv4Ff0oX3ORumDWz8CNH5eAoFT
	RoAklGxP9GBiYYzWutHXW7FixJ
X-Google-Smtp-Source: AGHT+IHdS1XCFIF/s+R2MzEjCr3KsXQm81WSnRd7sNkVOMb7Y4hp3EFixXPpBvYYArS7H/0Gwn6dbQ==
X-Received: by 2002:a05:7022:3b8d:b0:119:e55a:9bfa with SMTP id a92af1059eb24-121722b46d6mr35420452c88.22.1767224480383;
        Wed, 31 Dec 2025 15:41:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm143562327c88.11.2025.12.31.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:41:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Dec 2025 15:41:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
Message-ID: <ee2771f2-539d-4bb2-adc1-663e39488148@roeck-us.net>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-2-nandor.han@gehealthcare.com>

On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
> By default, the driver suspends the watchdog in low power modes (STOP
> and DOZE). In some situations this is not desired.

Following up on Krzysztof's comment to the devicetree patch:
Assuming the watchdog is in low power mode while the system is
suspended, it is all but impossible to imagine what those situations
might be. A reset by watchdog after the system is suspended simply
does not make sense. A system which must not go into suspend mode
must not be permitted to go into suspend mode to start with, or in
other words suspend mode must not be enabled to start with on such
systems.

Guenter

