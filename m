Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C302CB104
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Dec 2020 00:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgLAXoD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Dec 2020 18:44:03 -0500
Received: from gproxy10-pub.mail.unifiedlayer.com ([69.89.20.226]:35213 "EHLO
        gproxy10-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726066AbgLAXoD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Dec 2020 18:44:03 -0500
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
        by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id 08C041404B1
        for <linux-watchdog@vger.kernel.org>; Tue,  1 Dec 2020 16:43:20 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id kFIlkelXneMJHkFIlklT4w; Tue, 01 Dec 2020 16:43:20 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=R6ct5+ZX c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=N54-gffFAAAA:8
 a=fk1lIlRQAAAA:8 a=xMGZVK2oIwHWdiNj_j4A:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=6l0D2HzqY3Epnrm8mE3f:22 a=U75ogvRika4pmaD_UPO0:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XnT3k0EIydSnbbeuqqN1ROof0SCVPonvgsDAEnSO6Zk=; b=Z3OBa9bOYvCIZmbqFD9iwk25Sx
        LhW0NfYp9m8oSIoLCsiLZOqST6tV+B4B2FIA7xTqZDXnjLW6GjfAG6HEY9bJjcL6LyyfikcdFaekM
        iWuc9PwOCM2UfIAX9UaTqKGEb6+zpb+tF+EF1aKamxvjaer/3YYEP2bFHOXkgu/9kL81Wes8frmhl
        Iv4miFvfZE+EmknO+lAr8SRw6OetRPWpyXimRgWQ8ltaqpJDPtMQmREy7wcvJGqrhR5kHrDw8h7SM
        fDoySrvY2e8bxzJQ8LYrwOj4psl2sg+N6bOk/Lhvki0WHgxy4/1NdpkTGFbTNRt8FXlBDwyYoABCi
        ZGZHV7xw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33966 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kkFIl-0045l3-3g; Tue, 01 Dec 2020 23:43:19 +0000
Date:   Tue, 1 Dec 2020 15:43:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Corey Minyard <minyard@acm.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 1/6] watchdog: Allow a driver to use milliseconds instead
 of seconds
Message-ID: <20201201234318.GA16359@roeck-us.net>
References: <20200620173351.18752-1-minyard@acm.org>
 <20200620173351.18752-2-minyard@acm.org>
 <20200628145420.GA80485@roeck-us.net>
 <20201201225437.GC3110@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201225437.GC3110@minyard.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kkFIl-0045l3-3g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:33966
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Dec 01, 2020 at 04:54:37PM -0600, Corey Minyard wrote:
> On Sun, Jun 28, 2020 at 07:54:20AM -0700, Guenter Roeck wrote:
> > On Sat, Jun 20, 2020 at 12:33:46PM -0500, minyard@acm.org wrote:
> > > From: Corey Minyard <cminyard@mvista.com>
> > > 
> > > If the WDIOF_MSECTIMER is set, then all the timeouts in the watchdog
> > > structure are expected to be in milliseconds.  Add the flag and the
> > > various conversions.  This should have no effect on existing drivers.
> > > 
> > 
> > I have decided to go another route: Instead of using a WDIOF_MSECTIMER
> > flag, provide new callback functions. That increases structure sizes,
> > but ultimately I think it is cleaner.
> > 
> > I implemented a prototype, but didn't have a chance to test it yet.
> > 
> > Guenter
> 
> I was wondering if you had progressed with this.  I'm happy to help with
> it, if there's anything I can do.
> 

Unfortunately I got interrupted, and right now I am so deeply buried in work
that I don't think I'll get to it anytime soon. Major problem I had before I
had to give up is that everything I came up with was way too invasive for
my liking.

Guenter
