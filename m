Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E61950DA
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 00:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfHSWfH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 18:35:07 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44929 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbfHSWfH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 18:35:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so2032652pfc.11
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lq/0KmBJ5rxtCvhNKaFDUcKtkqi4MkkvKMNls0SC32g=;
        b=edjQvl/nZWhxBxx4li4S2+MUAhoy/TDCkW2CBHZn4G5M9k67obeCe3J5ZxYCGPFTvS
         duSjCSWGDdDMC0dENlOjLp67fZrWJz+Q3rYsa6/gMqwukbrXcqpdLVcsXggQloI0LWr7
         y7y6EmKRy2EhxgpihSTuf85lqMWkhcRlesvbC0zkX56q10kogiKaUmZFwtEd6BFRKjm+
         od+EOG8vYWniFEZVtYTwXUdLvojHBy/wwVfi5Bed7EAcD0NvEW7+9IkW+LBmj7pTnISt
         btvqWKdQ7R0wlPtxlMz52tczMbb4qcfki5QM+vDbV9lbb7b6gjvG1ohAmL1MWzOtKJOu
         CmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lq/0KmBJ5rxtCvhNKaFDUcKtkqi4MkkvKMNls0SC32g=;
        b=Oo3ltt3323nHmk7FkFcWXnGRqeJljjvbpRYgKDKypND++draM2dqwTtDZb/pK3PfzS
         H679H7VErtg1QI5Qgd0KlBhxVXM6f6zKuG/p7XAgicnCgGRvPm2RxTEgYkMXbWvz7NFP
         XKBC99Wa3TGevB7FMnQdnYOnW4SmCY9I7gCiBoyc0eqTBJ6vXkoyRVEJovkt7kUslE5Y
         P7PCTvoNmfOaxNNb99eOu54QiDwwEsJUsmoAJ+P8s4kyFBgSYZb+jmpYMhk5wpz+esfK
         uAZkU590iup3rQSr3cd1I4xsEX+aJRJYnTvuCBkq0gygRQheMCrXhl0kokt+O0vjybqG
         gihw==
X-Gm-Message-State: APjAAAUWnkK0MO7rnj0CI1r68B3oCj5M00Z6Y1AkFLpMPPVeU4+7CJcO
        g5q6aO6IuUPSPjdhewOz1tE=
X-Google-Smtp-Source: APXvYqwJsSYqIQDRh7b4VE/1SM2XbhrrLHpskPuonCbA3rpi6hiLOBbBVjb8GBdsxMIx/t6nxYKroQ==
X-Received: by 2002:a62:83c9:: with SMTP id h192mr26027117pfe.57.1566254107173;
        Mon, 19 Aug 2019 15:35:07 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id w10sm13616300pjv.23.2019.08.19.15.35.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 15:35:05 -0700 (PDT)
Date:   Mon, 19 Aug 2019 15:35:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Corey Minyard <cminyard@mvista.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH 01/12] watchdog: NULL the default governor if it is
 unregistered
Message-ID: <20190819223504.GA8869@roeck-us.net>
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-2-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819203711.32599-2-minyard@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 03:37:00PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> Otherwise it could be used after being freed.
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_pretimeout.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index 01ca84be240f..b45041b0ef39 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -162,6 +162,8 @@ void watchdog_unregister_governor(struct watchdog_governor *gov)
>  			break;
>  		}
>  	}
> +	if (gov == default_gov)
> +		default_gov = NULL;
>  

Good catch.

I think this should be inside the spinlock. I do wonder though why it
was removed with commit da0d12ff2b82 ("watchdog: pretimeout: add panic
pretimeout governor"). I think it was wrong to remove it, but I may be
missing something. Vladimir, do you recall ?

Guenter

>  	spin_lock_irq(&pretimeout_lock);
>  	list_for_each_entry(p, &pretimeout_list, entry)
> -- 
> 2.17.1
> 
