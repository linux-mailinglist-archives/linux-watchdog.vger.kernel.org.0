Return-Path: <linux-watchdog+bounces-4784-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5DD0B8F9
	for <lists+linux-watchdog@lfdr.de>; Fri, 09 Jan 2026 18:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B1FB302476F
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jan 2026 17:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678C235C18C;
	Fri,  9 Jan 2026 17:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtONhUx0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSgb6EGe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBA33659F8
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Jan 2026 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978889; cv=none; b=Boc3+D9UqGA9B1tyDoPj4lcej9j7ZUa9v/VM1XhcRnBF4x3PTv12bgIDCLJ5TNNE+d2rvKIB+uf2L/HueT2LtrdbuTbI9Zgl9sC4sjA3KGtv/tU7skjv/nY8EfB/aBbCfex/mUu7oHKtoOmangRTxe+9z/63BUZfm/EAXAzmtto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978889; c=relaxed/simple;
	bh=F7zcGk8nCH165bG+Lq3YX1vuc4Qm0989LRhZOuxR4Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dY02G3DmFoQKfNeVIgAhZTlFNND4kpYEB8sjIH3X6iirw7nolIx0JV7ADYXRgsTkid5cjKSUxkMOUG8IG1VG4YX5jSBI84GKFjI4QojvZyEAVra69Wl3kYg5LEDR23Gb/TKFEUMfBLgu1CSo0srncdABQQ2I99GnUmLsPBZecVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtONhUx0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSgb6EGe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767978881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
	b=GtONhUx0vrRef3kNQKmPJd40UO/vyVxBigKf+UVellqspn5ZitU8ttXpw611sL7KAZbOtR
	KCKFXpgLi7BPPLHRPFnpqjJ6EuYDohe4BMR1mu7NqwTALyB8trtm2dvzCIsvi22hF3PYjs
	0dsiW0IajmUMn2QviS7lRy6cCV7Hp28=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-jFyX7xjDOqSmg34eIZkMAg-1; Fri, 09 Jan 2026 12:14:37 -0500
X-MC-Unique: jFyX7xjDOqSmg34eIZkMAg-1
X-Mimecast-MFC-AGG-ID: jFyX7xjDOqSmg34eIZkMAg_1767978876
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so670032385a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Jan 2026 09:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767978876; x=1768583676; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
        b=MSgb6EGeh8JT3IbLKfH4m6CAu+Js0nnr3SoBBcPnaQU8c1LnlqRh1dGBm9UK3849GL
         2F7fHF6f+YV5RlJvlmFgwUQN2M+IU2WfowHmtq1jXIXe8uuq9sEdgcYeVofDRiGmqM3U
         SrvQ204jUXmCTbbJxynwSK4pTs947d9OH2xnBOqvA1dOz19pG2opZc2dPapF3Okos/lE
         LrXpNVOnOFrkUlSgyTrFHN/Zbm/Jg2uNz1iyOVmaEOuorO2ViVR2J3IeGdOVbAHu9chp
         OwBqDmZ3LcTj/kYzGtSXQ0PDWqpHXJMTnce1o0WPxR4UY+C2dncvyGK61g1s3Ceb5Qgt
         UM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978876; x=1768583676;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
        b=eg1AUtX25gFwTJGgT3876xG8jm3PGLUDJGE2c8BaOyRX1SBOUlBE+sf/hy3ObLMgY7
         ZxfhVQbWlNZu7x2RviFz3CWib68PkU7yyrHtVMRlVArrX6VjY0sKGBs6gAeNe4AoAT2J
         8nrmybRbEJe7pSi3XK9h+Wotjvun93iTtmQu0axApNp2iyykiMKuQTBYxuaRL5DO4y3Y
         UFpGLS2Fc4/5qajqz7pAyOWsfuvR+b6NOknsVXE7JbJ16wicmhlwiFNXouiqO2izqj0x
         yh6Sbfs3KtRJLD5Nn8VTghm0bi4/M6tXC5ygpmIXJYbYEkrcH2910kMDBKPH9r0JI/z6
         L4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUTotAQMfthyDkkkoyaDUVDC7Kn0D+G2QvozMIO4Jqf4IQWkygIVuD+I0sm/audYxNjd6MGkK7ydhzO5wJScg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+FA0nZOR49m3kWhZoLOPiqnlj8PxYsrAq/XyaSNBlCe8q+pWp
	kZ8xyMxo9pI1HIRPRkJNlVaSHbcO1vPSpiXmCAhQv5arbbcDxTqbhQd6i8sc6yC56aqY3m6N7Y5
	plEdpdRvJu2wT08VjgJNsqD+W0ABTPCLeeRYzIYuPrgEFsdXMdJHTOis0RA0OzGdxIzDm
X-Gm-Gg: AY/fxX4ZrR0J50xmasFrIWbEWU7Pl47/eDE4OPueCTmCjADznLINNfJzb8zygsLmeS8
	nli2Fn6MurQnTZtutr+O1Jf3g8VIYT9NHzTsy1TVQN9dXbAvJHtdQDczJJq2eevuScCNDmz4DXC
	BNzJwUzQig/DCl8t9HgMqHv9uY8msg3TZUwGD4ZGiks3KEZ+U3KZVmhYyKELh3mNDOOkwu5GrGX
	ikRPsZClFJIxSnzM19thB4SCVeX1FV/eeDaELoROoSK18KsyFK0cx9uKAxjzq5wztO+8iGihwAJ
	oxQqBBLX1aRJezpqZi687rQEDMRpOY9RWTo+p/H5j8MDh7YQpPFgc3w3Dz9E9CHC4OnhlNtlHCJ
	eX5KSGalhspxpERTUcGzgfNWhYzla+peLri65HU8uLiVZ
X-Received: by 2002:a05:620a:4109:b0:8bb:a675:aa61 with SMTP id af79cd13be357-8c3893fbb30mr1217151885a.79.1767978876347;
        Fri, 09 Jan 2026 09:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHotayWWfWtWeRCvw1eejr8Fm0argOz9TlIuQkrGTqEF91Uo7p3dq/qiwtr88DHNoO1lgXL4w==
X-Received: by 2002:a05:620a:4109:b0:8bb:a675:aa61 with SMTP id af79cd13be357-8c3893fbb30mr1217146085a.79.1767978875890;
        Fri, 09 Jan 2026 09:14:35 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726041fsm82384206d6.45.2026.01.09.09.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:14:35 -0800 (PST)
Date: Fri, 9 Jan 2026 12:14:33 -0500
From: Brian Masney <bmasney@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/13] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aWE3eWL_8U33TcsT@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 09, 2026 at 11:41:13AM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers.
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.

I didn't CC everyone on patch 1 to this series that copes pic32.h from
the MIPS ASM directory to linux/platform_data/pic32.h. It's available at
the following location if you want to see it:

https://lore.kernel.org/linux-mips/20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com/T/#m1e0e50adfe2ea4bf430025660fada7b1468d0fbf

Patch 12 of this series is where I remove the asm variant of pic32.h.

Brian


