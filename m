Return-Path: <linux-watchdog+bounces-3081-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF051A5C76F
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Mar 2025 16:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17229189AF9E
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Mar 2025 15:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A7825EFA4;
	Tue, 11 Mar 2025 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="JQ6RhWdd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6D925EFBF
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Mar 2025 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707014; cv=none; b=NfS38KM8soLk2CgAqmBUuapgNQfU7gGnfD3VcR81aCtAHE5jBKaGLS4n7fL80K06WPZqX2fdLH5tRfze04dgdU20YlgJ2ff+PpcGi2gT76TyLrJy8njWsCJafCpon9XAsBuhunIfGuVmorPSdAS1ba05y0Mu7yZ+ZPZorduj1uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707014; c=relaxed/simple;
	bh=WEnwXyp1KNhuJbFYBVFEdyL08xy1Euqg16M5opr1D6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJRijXX9QdkxWZe4RIpTF/v9fweW7u8bzcxo19sm4EA4kMLCe8JvXXg3zqZQKsF8XVA/ZapRM7TBnitilTvrMOIHTcy99fGbmuQ/wya/S9y+zc3GfQ3DPJE/ZuQAN/4qVOfbZR7z0J5mfMWL2cAxBgU7ulxHreAKd1HlRy3Gg84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=JQ6RhWdd; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 2E64840A9F; Tue, 11 Mar 2025 15:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 2E64840A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1741704948;
	bh=WEnwXyp1KNhuJbFYBVFEdyL08xy1Euqg16M5opr1D6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQ6RhWddaetdh/6tZTBbe4K7i1nuUqz7DhQO49i0kCTnQPEueZwy6LuAFWNOV1Ekn
	 cXVGe2PRb86N3Z7WtcE5V7LxN98XZ6+Ma4MqBqQMCrOuSMjdx2NCJe1jphKj9paI0V
	 WFe2X+MNULgwj8rgsFm1HjCDUle9vJlx40L39pA8=
Date: Tue, 11 Mar 2025 15:55:47 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: Convert to use device property
Message-ID: <20250311145547.GB5107@www.linux-watchdog.org>
References: <20250311141009.756975-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311141009.756975-1-linux@roeck-us.net>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Guenter,

> Use device_property_read_u32() instead of of_property_read_u32() to support
> reading the timeout from non-devicetree sources.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/watchdog_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index d46d8c8c01f2..6152dba4b52c 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -33,7 +33,8 @@
>  #include <linux/init.h>		/* For __init/__exit/... */
>  #include <linux/idr.h>		/* For ida_* macros */
>  #include <linux/err.h>		/* For IS_ERR macros */
> -#include <linux/of.h>		/* For of_get_timeout_sec */
> +#include <linux/of.h>		/* For of_alias_get_id */
> +#include <linux/property.h>	/* For device_property_read_u32 */
>  #include <linux/suspend.h>
>  
>  #include "watchdog_core.h"	/* For watchdog_dev_register/... */
> @@ -137,8 +138,7 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
>  	}
>  
>  	/* try to get the timeout_sec property */
> -	if (dev && dev->of_node &&
> -	    of_property_read_u32(dev->of_node, "timeout-sec", &t) == 0) {
> +	if (dev && device_property_read_u32(dev, "timeout-sec", &t) == 0) {
>  		if (t && !watchdog_timeout_invalid(wdd, t)) {
>  			wdd->timeout = t;
>  			return 0;
> -- 
> 2.45.2
> 

Added to linux-watchdog-next.

Kind regards,
Wim.


