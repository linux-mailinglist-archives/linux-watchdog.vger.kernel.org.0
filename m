Return-Path: <linux-watchdog+bounces-4749-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1DCEC137
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Dec 2025 15:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A40CB30181BD
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Dec 2025 14:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE77622D78A;
	Wed, 31 Dec 2025 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKZgQNdA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1325625B1DA
	for <linux-watchdog@vger.kernel.org>; Wed, 31 Dec 2025 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767190878; cv=none; b=e6y4ZgDfxxaVfL6S2A+oPWQvB6u9xLjDezEoHhuO6wfuGwKpfJiI6UQb1UprFQ8UDSQ/CaUcX7g6Cz7znCUnZxLorFhCNrqFc6RAjRpp4IbdZW0cI1Q0QF4/jtaZ99/5Bz2iaORo9jbCeGpN1dMfvfe7dXVrDjU6Bq3FAVHe8CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767190878; c=relaxed/simple;
	bh=r2Uth9U7WKhov/vK5un0vmXQcPHB8nP77J2jxlyhvZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmxT9/0Hbn0WGlMTNcxO99Ms8LUNqrMZS8sTbJ4yx+elwq+PKhOAkKJXQH4ERbM9EyvZoAojH9VLQQ0kWJ5sM0VGQEI3hBhk5xhObCGU6MT1NjbiZo270wg4kTU9mLjilSePKH17kDvzHYWiOf02xPBBJABmjMrdEt38FYe0hYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKZgQNdA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c2af7d09533so4245159a12.1
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Dec 2025 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767190876; x=1767795676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzYO9JmzayL0yuUYtlJegDApx7GTtBQiUgxaMjFJHiE=;
        b=kKZgQNdAGce5HQufegSFaFX/ZgUa5p02bzSYsAv35sfY+BQc1bNYTLgPOPWCt3TXPg
         dx9az7MLEa2DFC3gzSPjZy7XP5kNufob2bvuS+qq+JNyH0tR+84ll5g1kqgrHoL9hYsh
         MjfQVP/TAERmNSE9v4J7vA9vTQSgP/bRrpEYeDZ8EfMhl394UvotAlgeWhGAP8Sljlth
         VtSp6RhsaMY9KUfaPRjFMjrw5x8YNeLaLFgLAm2JFaYsNZeT0aA9vhABhxGru/oT83PB
         7Dep6yGUgXMKtzSH/AOWl9fv5YLBfgTfbmTqrI0XBtqzIQeYOKTJz7Bikx6OWhetMIkS
         2Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767190876; x=1767795676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gzYO9JmzayL0yuUYtlJegDApx7GTtBQiUgxaMjFJHiE=;
        b=brfT2N3o1qj+elXkBMVIbjpecjXV4EGlWd8OgFqybOGnT1ftHZswcswbaBZ44DdK0W
         1A8JUOiB6aqMPLD2mePNcMIuL9HLunXu0PVinirtdfdJeOdiu7LCMId7JcNiluLQbHG/
         fRy/51NA1mFV2hgQoU8akdj87VRnWmyG6wMovzDl0poP1srjuKnAD4h9cOC+8FGBxzbM
         F22FUKbrhgHQh06/Pf+g51T5IgxaMqU0iSOxTmhSLZi0TEQusBh6xv0KUiV/YQ0Hciaj
         KWvfoklp5D1VAGNdgDN4G7EXWjIBTXw1Tot6bAWJWB3Dqnl/LaTJz3xAkLwgn27423Es
         tjpg==
X-Forwarded-Encrypted: i=1; AJvYcCV10uxAbrTFVhgik5dLs7M8m3esWbmyuHywUiaXbEw1+Y4Ck+IAKbwER+bjR00NGS0reQi8LswYmWZ55e6A2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaWd8W38rHP0gTvtdO2VMTJ8cz9XTG5Z2P+sqh6oDFfknS1KdZ
	9MNNVemGvxGgz39TK/LFWRouVShDrPUHu880eA048DgmVUOmwcPbPORf
X-Gm-Gg: AY/fxX4yyyKa5NXV9vCc/nBKR7+lZ95K9dCraqdYRw2H+ygJCdJmQYIw13RkdzgFfMH
	oqrRCBN2aAb7u3oAe2cC9DTcQmI8yyJnbHi6zb3iLG55vdIMUzp+smBAD6W/h/3pFRnYz/U+Db3
	gatO4BkiP1ou5sNn6RBgkjI5Q1aqS8iXC3hN+DFE3A899SpMLMhZSjcVi2HcleKVkGZRXmFg3lx
	4wRm1xJ2ccl/6WF9ULmqk/sbSFegHFE/QRy4voK4ODuN6mdDNvZofqCpcSDfzIsIkXA99KPRUaP
	pJF0X6bIKlppZjf6mmHvIK9CZGoKqhyFgP/RoRwUqUhr5LEZITVBOymGj7GxeXpH84szrNoiWoF
	81UO7i/RkinnocQGci3bUTSKQ6CgoYedYuCQeIMmg2WAwuLzlBUb1I03PWQE+6louG5JcM7GwDk
	ntnlaRxkQ0OyrtWI+bYLemNhOf
X-Google-Smtp-Source: AGHT+IFgnsP5eRaXqQzLL4rLJAdlHfhko9526Hx9kq4lwC3UyU2JN6nvYeFIYRWixwii4UQFBV1t4g==
X-Received: by 2002:a05:693c:838b:10b0:2ae:598e:abe5 with SMTP id 5a478bee46e88-2b05ec56cdcmr24970156eec.35.1767190876090;
        Wed, 31 Dec 2025 06:21:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm86803322eec.3.2025.12.31.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:21:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Dec 2025 06:21:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Rodriguez <josejavier.rodriguez@duagon.com>
Cc: linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/5] watchdog: menz069_wdt: drop unneeded MODULE_ALIAS
Message-ID: <c4d03910-fda1-425b-8628-bf82d306527b@roeck-us.net>
References: <20251230215928.62258-1-josejavier.rodriguez@duagon.com>
 <20251230215928.62258-6-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230215928.62258-6-josejavier.rodriguez@duagon.com>

On Tue, Dec 30, 2025 at 10:59:28PM +0100, Javier Rodriguez wrote:
> From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> 
> The MODULE_ALIAS() is redundant since the module alias is now
> automatically generated from the MODULE_DEVICE_TABLE().
> 

Unless the generated alias is not "mcb:16z069", and it is unlikely that
it is. That means it is not really redundant.

Guenter

> Remove the explicit alias.
> 
> No functional change intended.
> 
> Fixes: 1f4ea4838b13 ("mcb: Add missing modpost build support")
> Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
> Cc: Johannes Thumshirn <jth@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> ---
>  drivers/watchdog/menz69_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
> index 6e5e4e5c0b56..3fe23451135d 100644
> --- a/drivers/watchdog/menz69_wdt.c
> +++ b/drivers/watchdog/menz69_wdt.c
> @@ -163,5 +163,4 @@ module_mcb_driver(men_z069_driver);
>  MODULE_AUTHOR("Johannes Thumshirn <jth@kernel.org>");
>  MODULE_DESCRIPTION("Watchdog driver for the MEN z069 IP-Core");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("mcb:16z069");
>  MODULE_IMPORT_NS("MCB");
> -- 
> 2.52.0

