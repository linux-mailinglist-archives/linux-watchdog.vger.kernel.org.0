Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B024C32DD8D
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 00:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhCDXEI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 18:04:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:42298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhCDXEI (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 18:04:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA6B264FF1;
        Thu,  4 Mar 2021 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614899048;
        bh=CijpqyykDmZtff1lsC55bZVXDNtVmDJMQ2LDEDPIWQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CszncG+i//sn9HKT8ySiaR1+o5hn8d5cKlC7cKJ5QbqtL7b/Qhl7PmNpXFcgUQINc
         iADOvGBSqW8ELQF8dqcU846WKfYgbrf4cpc0I5uuVVE04vvyXKBh98H9/LeqqDbHJv
         O4PoZ0Kz8sSPUprLdNOu4U6UhJxu+SMFUnOgG2+JEknVZ88q0kFz9N3uvO7IkvIuT1
         qv7iN+Wh3jnvGBj5qKg5dfDgOtqDoDGQ259XiLxguT0ZXgTIvZQDatG3V6lou2jzzx
         BZNtKe1gBWhZDxGjEDWZtOZdlCGddhLJwpts+QSAI8RgbjfXkfDF1vwvzFXwa+EK4N
         cuyqauJOTeZQg==
Date:   Thu, 4 Mar 2021 17:04:06 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 057/141] watchdog: Fix fall-through warnings for Clang
Message-ID: <20210304230406.GA106291@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi all,

It's been more than 3 months; who can take this, please? :)

Thanks
--
Gustavo

On Fri, Nov 20, 2020 at 12:32:51PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a fallthrough pseudo-keyword instead of letting the
> code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/watchdog/machzwd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/machzwd.c b/drivers/watchdog/machzwd.c
> index 743377c5b173..73f2221f6222 100644
> --- a/drivers/watchdog/machzwd.c
> +++ b/drivers/watchdog/machzwd.c
> @@ -174,6 +174,7 @@ static inline void zf_set_timer(unsigned short new, unsigned char n)
>  		fallthrough;
>  	case WD2:
>  		zf_writeb(COUNTER_2, new > 0xff ? 0xff : new);
> +		fallthrough;
>  	default:
>  		return;
>  	}
> -- 
> 2.27.0
> 
