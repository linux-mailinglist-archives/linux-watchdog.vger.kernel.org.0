Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3BF254B2D
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Aug 2020 18:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgH0Qwo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 Aug 2020 12:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0Qwn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 Aug 2020 12:52:43 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F4CC061264;
        Thu, 27 Aug 2020 09:52:42 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id i10so3791212pgk.1;
        Thu, 27 Aug 2020 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cFrCviqD6sQaDsRMLxYYb/sl5XjigXElsx6r7ij8ZMU=;
        b=BxAnVuNCUwa05YnNH/zNQtbyjPFoUDJaIKswqxyuy9LUvmW3TzcLFpb61nWwC7NsTK
         4n0mepErWgDTaQ3Cy4tfOQff/vHHLLadzO5j8bn0e/wbTr77IpJqUiGzbhUcYXi9itm9
         q0Cz6cy9o2XRcuMViWQc4Ip+eBfrU0jtWPI5GnDimGyBAi4Zitp8PpvCMQI51ujXae0a
         sHXHT8LM5e/5qQ9uAJ+xoevK2YQpSALme0poCMqGd2JwqQDiPDU+Q7sTceF5Su/Mfj9Z
         1akUoHITei4/EfOFhccqGueHwsgklklivbmFDCtNUBsSo3NAeUv/27T8qTqXX06kt8ii
         sL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=cFrCviqD6sQaDsRMLxYYb/sl5XjigXElsx6r7ij8ZMU=;
        b=jm/koe+VkvnOFBWVbxVANiVBx0r0f/n6zZpcYRthfou7ChwW7C/6UH3iFFMXoKfFQX
         m60XiYSk9lTCNi6MusqgD5k8xOtsHKElgato8y8uUCIWOO//CTvOBJvEYPoNlfBBJScF
         /qQMyEuK/JBm/tzgKy2AYkvuzltmNd/Sz6eO2IlgQ45aHYt7FVUJbuJtlaoSFN4eLxJ0
         0FgfrtHVt60el94F4WSAJYMLFXnTkIW40xcdm9M3VHepomQ4gYI/lmJ4GqfrNUrDq8yy
         ztzzED8+6mxD6PGtwPQrA3eSCjWR//3Hkn7/EHkRedt8X3YeF9R3Idw1ZHuscZCXv1DS
         4MVw==
X-Gm-Message-State: AOAM532jeo+TSaXZuoI7n9d/dBhYwUkCGIJz2ecG+0OA+R2Eue+xaHkk
        UJnAn4je1Nf+UHt3rzbLC24=
X-Google-Smtp-Source: ABdhPJxr+n+OSsp+32O2ufCgCEW5LgvHA4Cp1U5oNrCNUBiUNOKSXvQ1qyn1DfteQONL60AroARw2g==
X-Received: by 2002:a17:902:8d89:: with SMTP id v9mr16904114plo.289.1598547162259;
        Thu, 27 Aug 2020 09:52:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r61sm2854573pjg.24.2020.08.27.09.52.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 09:52:41 -0700 (PDT)
Date:   Thu, 27 Aug 2020 09:52:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] watchdog: sbsa_gwdt: add shutdown hook to driver
Message-ID: <20200827165240.GB86149@roeck-us.net>
References: <20200824081804.23206-1-qiang.zhao@nxp.com>
 <cdfd0c4d-3433-f952-0e49-ebc0f7474e1a@roeck-us.net>
 <VE1PR04MB67681C26D81E855A152043BE91550@VE1PR04MB6768.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VE1PR04MB67681C26D81E855A152043BE91550@VE1PR04MB6768.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 27, 2020 at 07:55:31AM +0000, Qiang Zhao wrote:
> On 8/24/20 21:29 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: 2020年8月24日 21:29
> > To: Qiang Zhao <qiang.zhao@nxp.com>; wim@linux-watchdog.org
> > Cc: linux-watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] watchdog: sbsa_gwdt: add shutdown hook to driver
> > 
> > On 8/24/20 1:18 AM, Qiang Zhao wrote:
> > > From: Zhao Qiang <qiang.zhao@nxp.com>
> > >
> > > Kexec maybe need more time than timeout of wdt(sbsa) which will reset
> > > the system.
> > > So it is necessary to add shutdown hook to disable the wdt when run
> > > kexec.
> > >
> > 
> > Please explain why watchdog_stop_on_reboot() does not work.
> > 
> 
> Thank you for your comments, it is helpful.
> I investigate this issue again, found that this watchdog are enabled by uboot,
> Meanwhile in kernel, it is not the default watchdog, in another words, it is not active in kernel.
> So watchdog_stop_on_reboot() does not work.
> This patch is not the right solution for the situation, I will abandon it. 

Yes, it is the wrong solution. watchdog_reboot_notifier() needs to be
fixed instead: It needs to check check if the hardware watchdog is running
(not if it is active). Also, the reboot notifier should only be registered
if the stop callback exists (and otherwise bail out with an error).

Thanks,
Guenter
