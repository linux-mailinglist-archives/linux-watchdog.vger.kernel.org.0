Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123F51CB8A9
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 May 2020 21:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgEHTy0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 May 2020 15:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgEHTy0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 May 2020 15:54:26 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E44CC061A0C
        for <linux-watchdog@vger.kernel.org>; Fri,  8 May 2020 12:54:26 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so1466852pfc.12
        for <linux-watchdog@vger.kernel.org>; Fri, 08 May 2020 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZNUDVr/QmRR7RX0QvSxKFZ3AHWZvcCVdQPxmdtqH4V4=;
        b=CS1zAsPDQuuRAKR9TQnHgeAKelRdi+wUXclQ0e2dBEsuskkOb+pe3nrIq42CsoF//X
         B/wXxJzyx88Ab+eWYybdTXmguFN5wgxpDNkEtN2/dN1OppRJlhBpFfqZGrfxlHX04FR+
         CMQrUlwWRJJysBhBOo9SRRaiIrcltJTMJot8I5RHoj4HH73AOFQmsoIsAj36z9AFkkly
         hFD2lUhg4PQ6JizkxVJ6/aKMIYrXg6wUixiYF5hByuZf+yRUSYHzquUFRYROiWKSU5iu
         +W1aNesijHBub2dASdiA5HPc3fIRt/+JVShkzw8muMMTJJEbeMKbyZnWWN3MZoTfKYMR
         eifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZNUDVr/QmRR7RX0QvSxKFZ3AHWZvcCVdQPxmdtqH4V4=;
        b=jOcnLq3+WlmuUEPgxXV8YUC4eU8BnMwC18YX/Qmvayo5C/KIeh4yTmNthFkLG9Opgf
         qWti5ROlRDqR8G31Va8UuBKX0BUQPj0rCmuA3DGSEdqmunCDp1dXUhJqBGvIwZGcPNXY
         rkcYqy5es27hAGIjFt8XlWQC7htBVlCPEGSpo4Zy64E1yEGxfo1MsKNkaA1IqIWkffeL
         zzHQq4JWrhhFJw+VLyGYU/9N3djSuf/B1IvoQEboGVk60wq8nkiHsZ7aVh1YmesKx2WT
         JBdsZ68f4Cf2KDKYo+L0qDV50Pt6L7ZgZwc3tahcNDDexkqzp2oSfjZfRm9ni2LPkP0F
         l5Ug==
X-Gm-Message-State: AGi0Puan0Nf+ko0FQrocPAYMfvcyfsWQ27IO5BTmkz9YAy2LGJnqinha
        elqPDPew7Btpve89y2deJP4Ufff0
X-Google-Smtp-Source: APiQypJ65hG1nBL9SCoZLc7excl9XvnjOS8Vo+yYoDzgRjvzr0H41aNr/Y0yMDri3/KgANmNSHLNfw==
X-Received: by 2002:a62:ab16:: with SMTP id p22mr4357509pff.216.1588967666175;
        Fri, 08 May 2020 12:54:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a196sm2603427pfd.184.2020.05.08.12.54.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 12:54:25 -0700 (PDT)
Date:   Fri, 8 May 2020 12:54:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: watchdog: m54xx: Add missing include
Message-ID: <20200508195424.GB65952@roeck-us.net>
References: <87blmyjjtf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blmyjjtf.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 08, 2020 at 09:41:32PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> Date: Fri, 08 May 2020 21:26:58 +0200
> 
> A recent cleanup removed the mm.h include from uaccess_no.h in
> m68k. This breaks the build of the m54xx watchdog driver:
> 
>   drivers/watchdog/m54xx_wdt.c:49:9: error: implicit declaration of function '__raw_readl'
> 
> Due to magic include chains the inclusion of mm.h in uaccess_no.h pulled in io.h.
> 
> Include 'linux/io.h' explicitely to fix this.
> 
> Fixes: 9e860351550b ("m68knommu: Remove mm.h include from uaccess_no.h")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/m54xx_wdt.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- a/drivers/watchdog/m54xx_wdt.c
> +++ b/drivers/watchdog/m54xx_wdt.c
> @@ -29,6 +29,7 @@
>  #include <linux/bitops.h>
>  #include <linux/ioport.h>
>  #include <linux/uaccess.h>
> +#include <linux/io.h>
>  
>  #include <asm/coldfire.h>
>  #include <asm/m54xxsim.h>
