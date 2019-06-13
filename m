Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77AE643D03
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2019 17:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732502AbfFMPjA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Jun 2019 11:39:00 -0400
Received: from casper.infradead.org ([85.118.1.10]:33356 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731937AbfFMJ5P (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Jun 2019 05:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Zd7Y7/fVtcy9h7LRt+pgmFLEzRR3UYPAM2/1CQ/alFQ=; b=tYM5mJx45M6Wd3ewpvbLR86+W8
        SpwhFYvZ77/1fEg0vrN5CzDDdt/+vsfic0cGQ/f7J09o3yyYkGqCdjhrFm+iw9asBDO2NQD3mykRn
        RLnFMTe/yn9f4PfWcYypmgjkeYUmtErMwbvH5xgFK5+XI4zUyTvqNm0XZxK8Rrd2W4oo5iZYaR0t8
        j7jmbSh1GCelXwnZIBgQNJt+VxCQ/scIVaxnx5oEAPDKDIkDLscobgmZdbHfz8IqXzeim4KLK3Hsb
        UySdk+tcmbbpd2CAxqXL9uLfhZUZ/M8hGAES907CieN7qPt7GVKh06p2EQ+6flP4hkzojBIA/HMP8
        n7eMhpOw==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbMTh-0000dd-MK; Thu, 13 Jun 2019 09:57:08 +0000
Date:   Thu, 13 Jun 2019 06:57:02 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] docs: watchdog: make htmldocs failed.
Message-ID: <20190613065554.1dd69b86@coco.lan>
In-Reply-To: <20190613000237.377-1-jerry.hoemann@hpe.com>
References: <20190613000237.377-1-jerry.hoemann@hpe.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Em Wed, 12 Jun 2019 18:02:36 -0600
Jerry Hoemann <jerry.hoemann@hpe.com> escreveu:

> Guenter,
> 
> While making htmldocs from linux-staging.git watchdog-next, the
> build failed due what I think is a missing blank line after a header
> separator in:
> 
> 	Documentation/watchdog/watchdog-parameters.rst
> 
> I'm a newbie w.r.t. to the .rst file formats, but adding the blank
> lines got the "make htmldocs" to complete.

Yeah, Sphinx doesn't like to see things like:

------------
foo

as it will miss-interpret the <hr> tag. That usually cause a
severe error the parser, breaking the entire build.

> 
> 
> 
> 
> 
> 
> Jerry Hoemann (1):
>   docs: watchdog: Fix build error.
> 
>  Documentation/watchdog/watchdog-parameters.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 



Thanks,
Mauro
