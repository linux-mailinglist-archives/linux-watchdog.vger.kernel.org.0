Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E343678E75
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 16:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfG2OyR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 10:54:17 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42809 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfG2OyQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 10:54:16 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay6so27649780plb.9
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PQhBByzuy3iaGCOOp5JoWEdJ2mYOzAZdOq7+FjOGIy0=;
        b=fhwJAXwDChgtpX1frMvvBWD46wv9WBz/Gpf8iFAmrgPb38EsjEyYS34nAVpdnBbNNd
         mueuJRXMI9uSEeIWGmoTSxawvfgJ1B9qBBODUXTHMuIeejbFF1DuH01C/6nJQaFa+VJ+
         XaXub5SUCNYVxTml4No/mGzEgjO3ShfZuGqy9Cx2B8XBgwVUMlgsK8ozWDBAG2x2WkM6
         OGFqbeA6B21c5eWHjw/SCCKzwlBeP5F+ZdSDfPtwaVHPRFbMqhaZaR6Fj+mjirsLcgx7
         Ty7vqxiqhgJgVZSMt2oOK5olNDIjxl2htCw0AW5XEKkMbpqT39RtGFqcJILl8uPr+Ecc
         2SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PQhBByzuy3iaGCOOp5JoWEdJ2mYOzAZdOq7+FjOGIy0=;
        b=kJkOOxxmEN6VuL+A2xDktL2JqILpKgCVj/z/ZNy4By3DN75Dzr22bhSN+bDhLYlKyB
         CvTuEasEnYtWraGAEhVhwPMA2gpvKryNj5bL3xBwetyFu4CBv3XN4rgV+YqfygJwqgHM
         V1Il7LhcOR4ahJ9XxE6JINApni3O2c7ciC9RxiyfUaAky2b4+YyXSkS+I60QDK2JIJ89
         zvgp5PcDWDl/b3iYcRm92yFByO+t4uMBZRwDBaLSVasKO1VlkcMYRxHIn6DOIycaFpsl
         rHTFUyDP0GyzbHTfrp8iO/moicrCWwbj3v9CC2jQAACYAhVpfTUvTMeZmm6WlfqiWJHE
         s01Q==
X-Gm-Message-State: APjAAAV9eSX5M8AHedJ39RXdEOEAx2EpcIjYmYxtHybkFF5IkbYJKqSv
        4MWaww2HPFAyt+rymRHVnt+pt/kl
X-Google-Smtp-Source: APXvYqwG2Oo5KDZH7P94O9Lca0CxUfAwMgHM4i6m5Wk6pu6R58YLvzqj8DmAVRI8W2pw2fA3VP+kJw==
X-Received: by 2002:a17:902:9349:: with SMTP id g9mr108728758plp.262.1564412056147;
        Mon, 29 Jul 2019 07:54:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u1sm58280849pgi.28.2019.07.29.07.54.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 07:54:15 -0700 (PDT)
Date:   Mon, 29 Jul 2019 07:54:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: Question about pc87413_wdt.ko
Message-ID: <20190729145413.GA21261@roeck-us.net>
References: <alpine.DEB.2.21.1907290727580.33358@mbalantz-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907290727580.33358@mbalantz-desktop>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 07:38:12AM -0700, Mark Balantzyan wrote:
> Hi Guenter,
> 
> My name is Mark, we corresponded in the recent past concerning a different
> kernel module.
> 
> I would just like to ask a question about pc87413_wdt.ko. In pc87413_wdt.c,
> the function pc87413_init() calls pc87413_swc_base_addr() and swc_base_addr
> gets assigned to. But pc87413_open() calls pc87413_refresh() which has
> spinlocks around swc_base_addr. There may be a use before initialization, so
> spinlocks get in the way. Is there a case possible where a bug/race
> condition may be occurring here? Or is there a hardware synchronization
> somewhere?
> 
Yes, the misc device should only be created after all resources are in place.
Question though is if that really matters, ie if anyone is still using the
driver. If so, I'd rather see the driver converted to use the watchdog 
subsystem.

Thanks,
Guenter
