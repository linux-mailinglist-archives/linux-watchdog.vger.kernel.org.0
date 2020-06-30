Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8019C20FE24
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgF3Utn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgF3Utn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:49:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198EDC061755;
        Tue, 30 Jun 2020 13:49:43 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u185so7895935pfu.1;
        Tue, 30 Jun 2020 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sQoAydE/3UY3Alh/aGXWB+4BkhDq1O/wJupmqiEZk5o=;
        b=LQOptagwhd+Vwu2bgtXRJPK7VgNJrpIbMAn9qdEyRPdVnuCsJMA6HhNJqB8T6DEyIJ
         7BhMZCYFsqqnAjPDchlJGJwtjch4l7nA/pjQUv57dLVoyw+FaOCRQKLYkTlwp+p2rPdD
         hgvkPGfrL9Aq2q7cLq20PYO93qPhW9SVDkRqYyLyjFJXjU+NF4pzu0DB6FBPmdLO8Dgs
         xwk77Oo49uTA5yPcZUL0nHc0XAClVphem4C79//jaRng1jPkrEsmy72vBBoae3HVPLuV
         nbRTs5gJ8DzQB5aIjmbGr4ejG8Crqejt7byp6tBFtdsjDb7zQHZWzpTQjyoR8xxW9kXB
         95KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=sQoAydE/3UY3Alh/aGXWB+4BkhDq1O/wJupmqiEZk5o=;
        b=EF2bmptlBGlgqOdaim9gH6vpebgyuo+chnlkSlmPEh4KA0SLdg+U3CKR77q/hqCYtY
         blLRBZTUNrNEoC+aa2Ukx4ZjIxrh2ucSnZuuqwf7q+G1He6Dpc2bNij0vvHYhUbok/bz
         jdTa9MMr4wJ8fxrlWMiD62pSMSMcf5IjQcWvSeYuNNyEh0vtZyBxWWR6bELm6pT0uZf1
         nKnDD6PEJBq2ivYJQlllI90c8ODiY6KU2SYg+ivqqbFBKu9yH64BvTXfu+jflbD3EOTG
         pgrmavBlQrD6YvAEq8vH9qWj2Jq/6LoOdrfbEnOQUYr0LvekBky5JSJL97NTgQ7wO2oe
         OPwA==
X-Gm-Message-State: AOAM5310gFYP8lttxOq3snWolCb0mX6Emk7Wqw0JVfkJUSu7fV4CdZa8
        qybAWdteJ2osbhttCExrw7b3A4yX
X-Google-Smtp-Source: ABdhPJxFi+QMSPKppjW0crVKIt+/uhwCuFq8PsfWF31k5dQKhwGYgSPOejxH4d+9bPw1v/zT08n67w==
X-Received: by 2002:a63:8b42:: with SMTP id j63mr16993931pge.131.1593550181938;
        Tue, 30 Jun 2020 13:49:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t29sm3569483pfq.50.2020.06.30.13.49.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 13:49:41 -0700 (PDT)
Date:   Tue, 30 Jun 2020 13:49:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/8] docs: watchdog: codify ident.options as superset
 of possible status flags
Message-ID: <20200630204940.GA21564@roeck-us.net>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
 <20200611191750.28096-2-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611191750.28096-2-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 11, 2020 at 09:17:42PM +0200, Ahmad Fatoum wrote:
> The FIXME comment has been in-tree since the very first git commit.
> The described behavior has been since relied on by some userspace, e.g.
> the util-linux wdctl command and has been ignored by some kernelspace,
> like the f71808e_wdt driver.
> 
> The functionality is useful to have to be able to differentiate between a
> driver that doesn't support WDIOF_CARDRESET and one that does, but hasn't
> had a watchdog reset, thus drop the FIXME to encourage drivers adopting
> this convention.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/watchdog/watchdog-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
> index c6c1e9fa9f73..800dcd7586f2 100644
> --- a/Documentation/watchdog/watchdog-api.rst
> +++ b/Documentation/watchdog/watchdog-api.rst
> @@ -168,7 +168,7 @@ the fields returned in the ident struct are:
>  
>  the options field can have the following bits set, and describes what
>  kind of information that the GET_STATUS and GET_BOOT_STATUS ioctls can
> -return.   [FIXME -- Is this correct?]
> +return.
>  
>  	================	=========================
>  	WDIOF_OVERHEAT		Reset due to CPU overheat
