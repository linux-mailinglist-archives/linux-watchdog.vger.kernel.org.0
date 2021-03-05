Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B702B32E079
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Mar 2021 05:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCEEPQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 23:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCEEPP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 23:15:15 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF74BC061574;
        Thu,  4 Mar 2021 20:15:15 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 97so537592otf.13;
        Thu, 04 Mar 2021 20:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ol2sv43a4c7Kzs6ae8wJhgcMGKRJ/yzNIsWMK1Kklyc=;
        b=Ooc/tUoSW2UBgDcqhkUmogJjPafbLq6iORWPUB7/Pm05vZtuMOJ+n7oJeLRnBBf1rm
         3wNAYHyN+/j6/0eknr2lqaE7nx0jjhLXH7oJRON8H1wIqq3+XQ+qnzr1kNSrd7Cear3P
         TGKa+LSxwBqf8twndWUYiBTnJRmOn2hsFmxTcAMJ/K5ukFrk83fwuMghdm50izVE0i7u
         pP2jNAFC0s2ePBWins7FCVr+mUcXkdZDL0TshbAtQCCUR6LhTwZfufPxvl070fg4CA+w
         fg1pcKthQG2ONzdVw2zokgq7YG+i38EM/Xg7Wjta9MfcSYRbKmdAXB3uzL2z4x0Mph7D
         6zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ol2sv43a4c7Kzs6ae8wJhgcMGKRJ/yzNIsWMK1Kklyc=;
        b=ZiCkHdHEB6EGptdthi5cNWw8ssW9vP6N/6aloSysuf8EujG2oimXcIZWp/exY8UKf9
         7AD+SadXZLTEhltCtB/I2v84ne1XBo+vxfDMTtkyjSPBfrNsNmfy7caLKbTX1YApesqP
         +PgQj674w6JwCj0Cs8nMDE9/Kk8VXhbiTXO8SctvN30XQkBUBaKjBMON4sJHqKiY4oRa
         QHS3JceMw3xyRiYQBHoumyYWadWATJDUlkYHO4HEMRaP4NOP6DOtkT8y+ZQY9LUaTiu4
         jrouG8ZGAQLv+LE9DXHrPjRN1BEcf6elzlz+G5J7KzNZe5mHtyXN6+fliqg3VeXX1z26
         8J2A==
X-Gm-Message-State: AOAM53341MUUiZf/Vt4hiWpdZ+zJRVpIwUx792S+gwe5oc7HCKWQ8WL2
        B3sUPI+TZOOAFWuAfQZQcCUQkAnaqVI=
X-Google-Smtp-Source: ABdhPJxNA1UIAtBtxML3r76Y1n0Txy1wTkIjXVtaAE4prVOhGr5pbup554TLRfsOKOcpIzsXvxoj2g==
X-Received: by 2002:a9d:6012:: with SMTP id h18mr6284641otj.336.1614917715028;
        Thu, 04 Mar 2021 20:15:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o20sm314811oor.14.2021.03.04.20.15.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 20:15:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 4 Mar 2021 20:15:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 057/141] watchdog: Fix fall-through warnings for Clang
Message-ID: <20210305041512.GA154288@roeck-us.net>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <713aa26be06d50dd3bb582a3cb71f04787ad5d5b.1605896059.git.gustavoars@kernel.org>
 <20210304230406.GA106291@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304230406.GA106291@embeddedor>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 04, 2021 at 05:04:06PM -0600, Gustavo A. R. Silva wrote:
> Hi all,
> 
> It's been more than 3 months; who can take this, please? :)
> 

I am not in favor of cosmetic patches for old drivers,
and I am not going to provide tags for them anymore.
The driver should be converted to use the watchdog core,
or it should be dropped.

Guenter
