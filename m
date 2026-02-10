Return-Path: <linux-watchdog+bounces-4919-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Bq6J9cni2m6QQAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4919-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 13:43:03 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2720411AF16
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 13:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB5BD302B39D
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 12:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B97E1D63D1;
	Tue, 10 Feb 2026 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iL+Wkmz+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFZWnSsK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA21DDA9
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727360; cv=none; b=ECQevaGZ9k08lLvx4cJWeFjl9IFHuDScEQNFF1Eqm8TNHd6W6hWhNlBGp0R1Zbw5j01XKYUqcuhuTND5pGjJdFosP738aQ6FWD4fslHWvsfeP7yOWh1Y8BzjFo9P1IX/3muvDNOnjzQPLH5b9DdCpHmVoNtzMCbVdj9Kg6UI8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727360; c=relaxed/simple;
	bh=GlKpwAqt8FXcLxnYzpl9cDfIBN0bnkDbFsP/hLk3P+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCPZ+98q8Vu7CZ8f9M3x151ihHOlYknneDnpl7TUGJ7+n6P+V+gKH+tYrxo0qilhZKnHzVX2Z0UoAukVQkStYGg0AXXeFeDKaL5nOkYuc2Buk4Dy4zsPpZLvtAurlvjE9OZmg1qlX0ti0t/Me2h1KPqPruy1UJ/iel89rfj7EJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iL+Wkmz+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFZWnSsK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770727358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
	b=iL+Wkmz+1/lPsyn2f3JRbUVEdChgq7bW70zvtlrgKQVQCTgqYd/f6pbxXqZmnhP8niOIZu
	9bZqzdPIWAcCeo+uVlXWGMGVhPgg5DWuqrGCfHzDi0iceglAZymA3WluD+guJpYj5Y7POz
	9yRqYIl7SvZNKho66SvXSKSO7JsXbek=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-TMHbIvHcMkSfaPRHWhiR3Q-1; Tue, 10 Feb 2026 07:42:29 -0500
X-MC-Unique: TMHbIvHcMkSfaPRHWhiR3Q-1
X-Mimecast-MFC-AGG-ID: TMHbIvHcMkSfaPRHWhiR3Q_1770727349
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947d47793fso257694916d6.2
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 04:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770727349; x=1771332149; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
        b=IFZWnSsKBQErk8CB8YJCIzGXGKhz4eZMSqPEtLSbj/uwH1A49Xj8LoEJhF6pcy7d2N
         wlrMn9/Sn1Mo4z1rC+00Go3UA6lbA3d6Hv4jolfseNvy6ah3yscypptRH74J9Ncsk6t1
         xD3mQC4Rnp8JTe0NG29vD8wdEU8kt24v6HpCcHydeRNMA6gp8lsgxaOr6upY/soKLji+
         WQtuTUoh3cqzEHwDKL5M2UpPRLACMunCmNF26lRd+oRTofcRF95ITIIln15DqswXvFOc
         rMsxu5C/5vi4M81xOYakJto56DcPPVPy8OmgVfkHCHCdcIFUSLgn67uLW3Z7ftTpq6R+
         6NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727349; x=1771332149;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIPR0mr/henT5bqfT/DKonkyulUdL16MgQRnA6kCJNo=;
        b=o37Qtyc9uw7z0qW9M0PZaED24DJeQjOhejMi8b71KeDddnyzYyMqY9RTAc2LMOdIU8
         Y1sJnczfmIhuikCBpg/QxYwFXksO+6Unp312R6DKBtpM1Wa3mhHjSCZKt8zySOfQF7G7
         YlQXgN9K4unv5njkXgaMrofPL3b5a/9SA8TVbbm1ehJTdWFXELn5HPsXTarRSd0g+wlu
         H+QiMt8qeIt0s7DVpOBjI1tTSpGyDVQxQG8kBCg4o7OIB6rpJoCmP/QbsZQcfXh7SXcD
         8TEsr3btSdd7idz9y+zup5II0E+6rBSmoaKtEXAQDFlm9xJT2MgmPuojTf/EzbNvL3jS
         20qg==
X-Forwarded-Encrypted: i=1; AJvYcCWFQjdeIelsqRUCo1Dy0f9jlynNkqCtEoJfArMMj0Th9I6xXeOTb6DxCh1YOy8VblsK4tjJhxBzNYeoCTF+aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4H78WHi4klI2ZOxy9lbhEn++/01HnSZlpE7cvsfs+sz/yuQah
	cApiuRM9w8/8WXxpsbSbSLxl1fSfPN7CplCULCbbO3LS68hZKdjIUXpnEDsrk+KvNn0zRZXhhlh
	r+WwURjLjxscIzqsgrBdU9KgAlmnOLNuPpak+a4LzipE5c+bQT1/u6GqNxNmP/L5WWIeR
X-Gm-Gg: AZuq6aKPCyWvelJPgPQ3SxfhSXGQj/kxZTxCj/KBu0hUfueeQlxRcAvDX1w397JpF8D
	Dy1c18082NMsrmq90dBN+wrNb0PQSG28ps9oDb24IuDUVsyvwFYyzGthqkXy59oa1Hqd5yyvzDQ
	rczg1x9OJKkfk4+9h1PhXCYG3EMi18Sw/d/cTyMILVjUPgD7Cw1ktLhu522HTR2VFYN4DqB7hFl
	NghJiF7R6LKyNgEGDTY6GooqrP+z5a5Vb7+/mLi/CortikUS6Y0h+c6YRknaeYlBHV4vwovHCIy
	GfoKQrmAT5k/ayrsSU0bISmkUF4sw8WvE6uXpik9Qv5PU7PZUYlstk6Dcsda4qKf4rpB9xI3qqE
	qdfPKKCVsbFgN0tFxRVM5BVJTuXQCNS4mGYau3pR/rVIo3PU5DOQN66yi
X-Received: by 2002:a0c:f952:0:b0:895:4cc2:8bfe with SMTP id 6a1803df08f44-8954cc28dc4mr97314186d6.48.1770727348950;
        Tue, 10 Feb 2026 04:42:28 -0800 (PST)
X-Received: by 2002:a0c:f952:0:b0:895:4cc2:8bfe with SMTP id 6a1803df08f44-8954cc28dc4mr97313856d6.48.1770727348578;
        Tue, 10 Feb 2026 04:42:28 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c0599b4sm99582176d6.41.2026.02.10.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:42:27 -0800 (PST)
Date: Tue, 10 Feb 2026 07:42:25 -0500
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
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH v2 00/16] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aYsnsecPa8bWMbaA@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4919-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2720411AF16
X-Rspamd-Action: no action

Hi Thomas,

On Mon, Jan 12, 2026 at 05:47:54PM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers. To do this requires
> updating some includes, which I do at the beginning of this series.
> 
> This series was compile tested on a centos-stream-10 arm64 host in two
> different configurations:
> 
> - native arm64 build with COMPILE_TEST (via make allmodconfig)
> - MIPS cross compile on arm64 with:
>       ARCH=mips CROSS_COMPILE=mips64-linux-gnu- make pic32mzda_defconfig
> 
> Note that there is a separate MIPS compile error in linux-next, and I
> reported it at https://lore.kernel.org/all/aWVs2gVB418WiMVa@redhat.com/
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.
> 
> Merge Strategy
> ==============
> - Patches 1-15 can go through the MIPS tree.
> - Patch 16 I can repost to Claudiu after patches 1-15 are in Linus's
>   tree after the next merge window. There is a separate patch set that
>   fixes a compiler error I unintentionally introduced via the clk tree.
>   https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/

Sorry about the duplicate message. I just wanted to reply to the series
with MIPS in the header so this message isn't lost.

Can you back out these two patches from your tree in linux-next, and not
send these to Linus?

clk: microchip: core: allow driver to be compiled with COMPILE_TEST
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=026d70dcfe5de1543bb8edb8e50d22dc16863e6b

clk: microchip: fix typo in reference to a config option
https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a6ab150deb4b740334721d18e02ad400a9d888f5

See
https://lore.kernel.org/oe-kbuild-all/202602100954.BAVYq6aC-lkp@intel.com/

All of the other patches with the include changes are good. I have
patches queued to send out in two weeks to other subsystems once the
include changes land in Linus's tree.

Thanks,

Brian


