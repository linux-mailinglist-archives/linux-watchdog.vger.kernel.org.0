Return-Path: <linux-watchdog+bounces-4782-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01ED0B89F
	for <lists+linux-watchdog@lfdr.de>; Fri, 09 Jan 2026 18:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E4C43001012
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jan 2026 17:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4D923ABA1;
	Fri,  9 Jan 2026 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GlMOd2eq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yfz7W8Ts"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C61364EBA
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Jan 2026 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978686; cv=none; b=lw64kslHynA1MdQRy2LAc+nuaiTwqNpwSKmK4W98mYIPE8VXMM0CTg3LNrrxw71pIbPnVGiK2FVKf1zPHckYqZaU2mz4bvVZP/Lgh2lr4WIK6Akg/CY4Trx4vFb1J/5GFVFCXMKyeoVhf+yjQL5tdqTwmpDNJu8aLmdIXPPji9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978686; c=relaxed/simple;
	bh=hZlthMs16BIBk/qMEDIm108LDyrd8Ui+nEJqQrdF1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiQ9U0RyeVeLJE7/M7mE2MSWi0vk30zI8XEvEDWW1y/osSpf27Zz2hTO2xuCjPHIxP+ge11n747W0N4KEtnt/mLHSk1HtRDhfxAhrLtU3dHjd1lhwWgnHdDe7cJMO5+sFkj43VO4l7ihk3DmifizUgh+1fBr3wfxRXXyteZUUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GlMOd2eq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yfz7W8Ts; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767978683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaNh1aOnh2JoHokgzqjtqefBtdcVeVnfRZ9qQn4NnSA=;
	b=GlMOd2eqBga5VG5aiDfnQdGLZAuxbrF7WGikvHVSY83yztsWa48znfJs1+xh2PpSGY28mJ
	L4J9e1ornlydSDpQlqLhUT1YBlMAVT4OjaTY54cX0znZVYVU1/IcrXP3LgJV3SM1lTwxZF
	tT82POo6cjwNCxPEkT4TilZT4u1M0Ic=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-h7RElI6MNo2QqIgI3yJ9BQ-1; Fri, 09 Jan 2026 12:11:19 -0500
X-MC-Unique: h7RElI6MNo2QqIgI3yJ9BQ-1
X-Mimecast-MFC-AGG-ID: h7RElI6MNo2QqIgI3yJ9BQ_1767978679
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50118083cf5so590411cf.3
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Jan 2026 09:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767978679; x=1768583479; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaNh1aOnh2JoHokgzqjtqefBtdcVeVnfRZ9qQn4NnSA=;
        b=Yfz7W8TstWPVmqnMPL4PfwIlAJaNYLfe23Bfy7zWhawDT/vpjf9HOq1l2T9RyJtXri
         JNUbQoxUkk3HVV6NPwCSzdWD9rJWxfDE5SsUjO7G2cHhrdeZy4TgeeKp/zleR250CY14
         zq5X+uHs1yn09jtW8hG8YvJUEShn+1KbePqaD+Vih4fBBR2dVHHP3eBHjIgD7npBQ1w8
         91cuArzg6Pmv1DsOBTd9Y97SlEqtTt29grsyeJTbJ73mVIbfqGILcJ/KVOF/FJv9s8jM
         EEyk/lggZtSoWe+ISh0/lKKhQauuKiPsKRDPUZgFjGwQJLBXTg83VNqsln/y+mWfOXp5
         fONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978679; x=1768583479;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaNh1aOnh2JoHokgzqjtqefBtdcVeVnfRZ9qQn4NnSA=;
        b=swiNqgVg/nZo9AQ3yBW84TZcHkjtPYtfBfyPH1sIT+VbrrZ3maQebsHGC4QYgc7oI5
         qw6hZd9q8JKn+VIqYXTuCkCrdpHIrcy+Po5GOrmb3Dqp5TsyhVEBwzB8Cf5HDFpIeX1n
         PZmbH1hS1dKE3tLe1FoIjs440EnfdxH9C/NQQIO9V90A7uBJ4qYEgSoYK14l39RbbckI
         yfDjC+KzuYIexZWSFPP/0AkrBFHUwD6qRJ2/+0ZFvHRqt+UvabJYEWK0GJTBwX3JjAHX
         C4xgYhNZCgo1GZ2ikyNH0GAkeJJODqR4NJfui8swJTMGQ5NveXeRwPv6wadGAuaMqovA
         uvpA==
X-Forwarded-Encrypted: i=1; AJvYcCWxZY5yRMEBGEoIne8IGQsZ4VWmqRXA5ZKtOgHdRwUd+qLS2plsRO+xrXWfjTqXIyyYV2he3l7HDbqWSXf+hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz69AQ1YGByx7y88ZDizLJ8+ZVcveMNE5PzScrhKtyu4Luigd5
	05mL7AqB+RNw4+Qj4X6xVpgc0lBZRIxVqYG8l/NMgRBtm4qIPlm0v71sPyNhGyDQFrIpzZw2d5V
	eymWIeH+pe4k+IE1vG2ZX20oHog37B8FGaLnYBFmDAti9/4O9QyK97tkIbszqx8+1SbpJ
X-Gm-Gg: AY/fxX43zOsvPSYlfvd6KPmdl4RV2bqYhXJxeNvhXgE9eTyuX3j4YgA+miXhIGmm/Dp
	d4rs8P0FGwGxc5lI+Z3v2PCyI81JqXh2+Pa4Q148FL8rNwg5c8uM7gyqAjZ5wWx9Ocz7CChxpyt
	qkzw8nRvuoqK9H9U+uqfniJ5vxFzu9n+KPWmmR32pQBmSxcW0cccDDaxVCO05PzR+YUmp9/v9Me
	5mM7537PJWoM6xL1BlZnH6jrNDE5QzjH9iXCwIuXrvbo/getewU+n8mMyyhQdZNhXKHb05P9rAR
	JSXT+G0RpOhXlRx65tgB87Azb/zRQYqTjukNslLizCYBYQvgXw/4Mlzt6qd438zvSoXx4vsD2PN
	Zt5q3smz8JsADginVXy3bDhIbx9SigrlIq8gUxvgD7TGc
X-Received: by 2002:a05:622a:1983:b0:501:13ce:4e0a with SMTP id d75a77b69052e-50115a22b10mr15947121cf.10.1767978679073;
        Fri, 09 Jan 2026 09:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6W3jQ4EC1equ15tu9ss8Q0f0JXrCzzklWOJCr9z6Xp7FJh/1DVrZv/v2VWVLfcJHtLX86uQ==
X-Received: by 2002:a05:622a:1983:b0:501:13ce:4e0a with SMTP id d75a77b69052e-50115a22b10mr15946481cf.10.1767978678490;
        Fri, 09 Jan 2026 09:11:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e8cfasm78669306d6.21.2026.01.09.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:11:17 -0800 (PST)
Date: Fri, 9 Jan 2026 12:11:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 10/13] watchdog: pic32-dmt: update include to use pic32.h
 from platform_data
Message-ID: <aWE2tCUkePX8Cls-@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>
 <76129cc9-345b-4866-8cb9-b36e4374cf8b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76129cc9-345b-4866-8cb9-b36e4374cf8b@roeck-us.net>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 09, 2026 at 09:08:37AM -0800, Guenter Roeck wrote:
> On Fri, Jan 09, 2026 at 11:41:23AM -0500, Brian Masney wrote:
> > Use the linux/platform_data/pic32.h include instead of
> > asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> > is in preparation for allowing some drivers to be compiled on other
> > architectures with COMPILE_TEST enabled.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> 
> linux/platform_data/pic32.h doesn't exist upstream, and I was not
> copied on the patch introducing it, so I'll just blindly asume that
> this works.
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

I didn't CC everyone on all of the patches to reduce the spam in your
mailboxes.

It was introduced in patch 1 of this series when I copied it over
from the asm directory. I'll reply to the cover letter as a heads up to
everyone else.

Thanks!

Brian


