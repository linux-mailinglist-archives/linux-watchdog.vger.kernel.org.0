Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8074881C6
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 19:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfHIR54 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 13:57:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42820 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfHIR5z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 13:57:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id t132so46211725pgb.9;
        Fri, 09 Aug 2019 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Z/waT+yUtzVHffxQ1R8r6mg5aaqvSw+hD+F0A/jXqSs=;
        b=ggYukkeU7ipX4clsulpaEz3yy0PP8c2g9kpNS+zb22HDTDflH2rLNp0kF3ZtKIxWDL
         emf2WGHCZNnn3rR0Iu1lVUuXxrWTwA5Y2wfmjZ0hh9aTe56C8KS4jxfAdDJmMJLfx68M
         ly0pcs6D/X/zP/5eQXMidjQVKpINRlVTdTPISmeSaYSfp0euANLyxLi6ydpv1iGmQs2j
         IEJUMfmcTlShjOZH25lS1eg99izC1ZuWSOPGui5xj6cqJPG/e2pZvdwuwBxFuM+zM23T
         HXPZrESUP8++/+3gw9e/zzxDAaQ20ZRwIB/rS9xkbpmhGgbj8aNgEP7wbeevqdyNIj0x
         6ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=Z/waT+yUtzVHffxQ1R8r6mg5aaqvSw+hD+F0A/jXqSs=;
        b=OKLCzei0utbzaPGXr8SWig6AySkbU8/HyxTEfNS8qWgn/hjm6xGqR5yirB9eWybW6p
         3Pq5l/TPYMcSk6Ypp4s3DehP2BcpqH6kCskh6uqYtgLjujCnloEAMilQczMNDu+Nds7o
         dkiYdLJ1LX2d6RTe98S5cgy2hPvKtDf8IW2a17KOcCGtBVnOpsWRyQzoocEklfcqsN3p
         QIE+AFwiI2LCRElgIaxIfVi1pqam+h+wphiHg5l84LTWVypzUg5denJvRuiYuDv48uZI
         xjjUOZErUi7NteRibyMzdmolgzBtmAZLAjOGGFVXqL9yiXOLFbSnEcHa/uEWoT3WmVzl
         oIWQ==
X-Gm-Message-State: APjAAAV3jf0+MhEC/VvfG9/wWbFlzDKWAocqO+ObJDPI6NlixBa2F/Sa
        nWPJHC9rMcTpCfPAYs1sPDPAFOTU
X-Google-Smtp-Source: APXvYqzcGamYb+sagJH5GcTXjVvAOTiFJD2bxpvu1VhiMCTv2VREReisSeUJ819UYcFsvCmBbQcj4g==
X-Received: by 2002:a17:90a:8c90:: with SMTP id b16mr10547210pjo.133.1565373474999;
        Fri, 09 Aug 2019 10:57:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u7sm88620082pgr.94.2019.08.09.10.57.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 10:57:54 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:57:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] watchdog: jz4740: Driver update
Message-ID: <20190809175752.GA23323@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
 <20190809165207.GA18104@roeck-us.net>
 <1565369726.2091.0@crapouillou.net>
 <20190809172906.GA21450@roeck-us.net>
 <1565372089.2091.4@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1565372089.2091.4@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 07:34:49PM +0200, Paul Cercueil wrote:
> 
> 
> Le ven. 9 août 2019 à 19:29, Guenter Roeck <linux@roeck-us.net> a écrit :
> >On Fri, Aug 09, 2019 at 06:55:26PM +0200, Paul Cercueil wrote:
> >> Hi Guenter,
> >>
> >>
> >> Le ven. 9 août 2019 à 18:52, Guenter Roeck <linux@roeck-us.net> a écrit
> >>:
> >> >On Fri, Aug 09, 2019 at 01:59:27PM +0200, Paul Cercueil wrote:
> >> >> Hi,
> >> >>
> >> >> This patchset comes from a bigger patchset that was cut in smaller
> >> >> pieces for easier integration to mainline.
> >> >> (The patchset was https://lkml.org/lkml/2019/3/27/1837)
> >> >>
> >> >> The reviews were kept since the code mostly didn't change. The
> >> >>exception
> >> >> is the use of device_node_to_regmap() in patch 2/3. This function
> >>was
> >> >> added in a prior patch, now merged in the MIPS tree.
> >> >>
> >> >> For that reason this patchset is based on the ingenic-tcu-v5.4
> >>branch
> >> >>of
> >> >> the MIPS tree
> >> >> (git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git).
> >> >>
> >> >
> >> >What is the expectation here ? Should the series be sent upstream
> >> >through the watchdog tree, or through some other tree ?
> >>
> >> You can get it through the watchdog tree if you merge the
> >>ingenic-tcu-v5.4
> >> branch from the MIPS tree. If you'd rather not do that, I can get it
> >>merged
> >> through the MIPS tree.
> >>
> >I would prefer a merge through the mips tree.
> >
> >Guenter
> 
> Ok; Can I get some signatures then? ;)
> 

They are already tagged with my Reviewed-by:. Do you want an Acked-by:
as well ? Sure, no problem.

Guenter
