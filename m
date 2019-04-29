Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54B1FE7E2
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 18:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbfD2QhD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 12:37:03 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36303 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728600AbfD2QhD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 12:37:03 -0400
Received: by mail-pl1-f196.google.com with SMTP id w20so4709534plq.3
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Apr 2019 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mvf6QVfxq8XfQTDk9R9fXF79Nh5shTOGXeOmWM/yxF4=;
        b=pgxVogO8NMLnlp6nK513qrx95YzpZb3CL4OErCllulRSc5NADDCgyEmM6//zYn+8r5
         WUrn+5XAUkAct3qyzWi4Z/r5p7n+BA0XROqYhhRYgk86N12m6Y3muVtcZlQJu22v9Ogg
         3bWLDMq2RNRXWL5vLCxsUVTjpAndcl0vBv11NPhDaMvONsYR/2AD36BCo9/+4A8uE7Fc
         L/QIDHoQE+4XLkOjKwSPfm4h4etHB7a/mL+uZGxWNaiZIy0mXD8cc63m7FnLmO7bPxGU
         6rUzcMUk7uAWgyr8JIGbEsaa2lsCoUU3lsmIulglp7xXSq+EMIXglDt5qSQRDDT1OIC2
         f2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=mvf6QVfxq8XfQTDk9R9fXF79Nh5shTOGXeOmWM/yxF4=;
        b=UCQwOwdB18QjotVyKiJUIYSRPM1DpX8ue2c1mmvP1kNJ6sZkLgPSaiRfgRtSzOB3vz
         nGBgLry3hHSP15sIgABuurBnJocFs5O78nW8a9ufShzdyCnajlNeTezDzem2WpfXyFOc
         wdY2ISNF2UIbO3nTdVcpnCdI69FAEidbse19KFCE6jM6K6F8Vh+y1rxfWynn2X7vbN+n
         3xWnJc6PH5un3KlzOosMhIzW9bqsk1AK6gNkuxqTzRyIM58AOAwx7whKfNaJx86a2OKN
         xn0JwPRkB+x/TltNPwbVmN1fA8dgViWCshx52lJdziikbz7Oj77m3xvywhad/Cl0MyxT
         M7cw==
X-Gm-Message-State: APjAAAXfBqOWnr+bBVvNx+8BkXXGDhmIo+ON+hGKLlUaOWAwHzNo7JDr
        ZPQhYX9f/lcRi077P1fQzw0MxlE5
X-Google-Smtp-Source: APXvYqzj2jYB9pvy5NK6FKVsR/mc96SKFq/3z0WrBsDYMB49y3z2j99E4AU2+9bDR7Oro/4ZGGdrtQ==
X-Received: by 2002:a17:902:9a4a:: with SMTP id x10mr21395388plv.113.1556555822782;
        Mon, 29 Apr 2019 09:37:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a9sm45434872pfo.17.2019.04.29.09.37.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 09:37:02 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:37:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@iguana.be>
Subject: Re: [PATCH 5/5] watchdog: coh901327: make it explicitly non-modular
Message-ID: <20190429163701.GA14063@roeck-us.net>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-6-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556034515-28792-6-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Apr 23, 2019 at 11:48:35AM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> config COH901327_WATCHDOG
>        bool "ST-Ericsson COH 901 327 watchdog"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_ALIAS is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
> 
> We replace module.h with moduleparam.h since the file does actually
> declare some module parameters (i.e. boot args for non-modules).
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
