Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFCC88B79
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Aug 2019 14:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfHJM43 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 10 Aug 2019 08:56:29 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35339 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfHJM43 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 10 Aug 2019 08:56:29 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so46041415plp.2;
        Sat, 10 Aug 2019 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=191WjuNAOmHc5XIuKXgelKfZpim3OFPPT9MjVQsZAuQ=;
        b=QuShlIy/8pJlwRIbGxWiUBsVywQ91DK5uVOlRphtXYxLUMLisc1BRXlAHEmP3fjUqA
         dcX3nBE+Wioxjze0Th4K3axpY2hFm0Up9QsId8TeUQKPADZ59BzejuT/paxtfi/McIJm
         F/7fTLrSCWkyz+ZcuLg6vRtn6UxMX9sBnjM0EmpKURJS8vH0kgOoXiB0mpAdfC7FHUy6
         py76K8ZxnytD179JzMnU8fXuhf8MG+/mFz/L8RhAL0+2enTya6MGBLN20H5mMJmX7MKf
         HImD1VdxFyT2OZgm8lZITUx4K6ytlNY3j3JAFoKAnVbPnhqswjzluCc53NAlhNwiBTWs
         654A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=191WjuNAOmHc5XIuKXgelKfZpim3OFPPT9MjVQsZAuQ=;
        b=Uxry/UrERYA72cpIiI8lqa+xvE48woSHilrV8wZPxtbQtERvNSXnhoX57dC4Q9SWop
         tu3YXpJesJu9794bA9xF6rddNRTj1IOSIW4Bnf/D2x78FRyUbzkiTZtPXUyrYqgYySNl
         M4AY1T6CYNRicQDJ2wrJDxTJEkzDUdRnwDJrn1RmGAizTMEj1aV+h46Q40cGyI6ncSnm
         KyAPVqDV0E7q5lJ9dZWAYnxdDHd7xf7j3YazLsqq2BFH3/pH5TSy6MBSy6NaWVrIyCSw
         fZA1oPaHvhsA3cxqZqcLgeRgbbNiKX879aO7BqwGLa90+K+jZV/d01X8wCowYdr7NRpa
         2rdw==
X-Gm-Message-State: APjAAAVJHeI/ZA2c9q4+hfvESX9gqkmkkZoA6E5286zu89Nc+eIb6yAr
        3YY1BxX4SUMY7VQ4SO5Clh29GKXY
X-Google-Smtp-Source: APXvYqzaTxg2VuzxidgONhXDoYub2AcQk2ZY6+EryRagKqz04ayJuiixGM++rMRMzmmesRqwnMg9dQ==
X-Received: by 2002:a17:902:7083:: with SMTP id z3mr19071667plk.87.1565441788775;
        Sat, 10 Aug 2019 05:56:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p7sm115585700pfp.131.2019.08.10.05.56.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2019 05:56:28 -0700 (PDT)
Date:   Sat, 10 Aug 2019 05:56:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/16] watchdog: remove ks8695 driver
Message-ID: <20190810125627.GC19990@roeck-us.net>
References: <20190809202749.742267-1-arnd@arndb.de>
 <20190809202749.742267-5-arnd@arndb.de>
 <20190809204227.GA19839@roeck-us.net>
 <CAK8P3a35Aa3-LKi+uWh5SJQpYKqd5VsTw6BhwTxwWW=Vh5B+Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a35Aa3-LKi+uWh5SJQpYKqd5VsTw6BhwTxwWW=Vh5B+Mw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Aug 10, 2019 at 10:37:14AM +0200, Arnd Bergmann wrote:
> On Fri, Aug 9, 2019 at 10:42 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Fri, Aug 09, 2019 at 10:27:32PM +0200, Arnd Bergmann wrote:
> > > The platform is getting removed, so there are no remaining
> > > users of this driver.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Please let me know if this should be applied through the watchdog tree.
> > For now I'll assume it will be applied together with the rest of the
> > series.
> 
> For this series, my preference is that you apply the patches through
> the subsystem tree as there are no dependencies.
> 
Ok, I added both patches to my tree.

Thanks,
Guenter
