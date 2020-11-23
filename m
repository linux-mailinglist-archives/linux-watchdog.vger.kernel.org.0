Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2892C18D7
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 23:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733213AbgKWWub (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 Nov 2020 17:50:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:50608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733091AbgKWWu2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 Nov 2020 17:50:28 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADCB5206D8;
        Mon, 23 Nov 2020 22:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606171828;
        bh=prSunxx9UrmHQV1SVpB7IiA7MCaL2aW33t5lBC+FXKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BQmknOSHEmt7Rd0eMahtV4W/mur0u5SqAY0dhDc4wY9bPXlbOhaybje85M8jyi19U
         gVbwMCmo1tzhA00+7O8fmx8Tjbj+s9maBHwdKgeO7wsRp0yFwAzUyuQKp+SlR+wlvD
         sfgh/KB+sWv6XqgFI9nmfUab9/Cu4VU96a02xDSU=
Date:   Mon, 23 Nov 2020 16:50:42 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 057/141] watchdog: Fix fall-through warnings for Clang
Message-ID: <20201123225042.GO21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
 <20201121184951.GA114144@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121184951.GA114144@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Nov 21, 2020 at 10:49:51AM -0800, Guenter Roeck wrote:
> On Fri, Nov 20, 2020 at 12:32:51PM -0600, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a fallthrough pseudo-keyword instead of letting the
> > code fall through to the next case.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/watchdog/machzwd.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/watchdog/machzwd.c b/drivers/watchdog/machzwd.c
> > index 743377c5b173..73f2221f6222 100644
> > --- a/drivers/watchdog/machzwd.c
> > +++ b/drivers/watchdog/machzwd.c
> > @@ -174,6 +174,7 @@ static inline void zf_set_timer(unsigned short new, unsigned char n)
> >  		fallthrough;
> >  	case WD2:
> >  		zf_writeb(COUNTER_2, new > 0xff ? 0xff : new);
> > +		fallthrough;
> 
> fallthrough to return ? Oh well, this is an old style driver anyway,
> so I guess who cares.

:)

> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks, Guenter.
--
Gustavo
