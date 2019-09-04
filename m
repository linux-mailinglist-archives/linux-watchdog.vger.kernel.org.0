Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACADA7C7F
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Sep 2019 09:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbfIDHQo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Sep 2019 03:16:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727787AbfIDHQo (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Sep 2019 03:16:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F4972339D;
        Wed,  4 Sep 2019 07:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567581403;
        bh=f8EZZerqx22BqB3RzsXbmB/o3MYtSOE4T3XPD3UXaF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zOH9JjFruJCTTp6kIevTzvliq7OO6RNlAwGbxMUKh1HPeKn6iGeK7F5qysATWd/MA
         1mb63cLoc7GFYiZaVbE4/QFb6uqSKTiUUfrZIN+fcJN00gJCbVebCy7ZfVliaTw2fX
         C1F/6C8502bHkcoajUicecgDdGdYoCHK8gGfazwg=
Date:   Wed, 4 Sep 2019 09:16:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        arnd@arndb.de, jeyu@kernel.org, joel@joelfernandes.org,
        lucas.de.marchi@gmail.com, maco@android.com, sspatil@google.com,
        will@kernel.org, yamada.masahiro@socionext.com,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 09/12] docs: Add documentation for Symbol Namespaces
Message-ID: <20190904071641.GD18791@kroah.com>
References: <20180716122125.175792-1-maco@android.com>
 <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-10-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903150638.242049-10-maennich@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 03, 2019 at 04:06:35PM +0100, Matthias Maennich wrote:
> Describe using Symbol Namespaces from a perspective of a user. I.e.
> module authors or subsystem maintainers.
> 
> Signed-off-by: Matthias Maennich <maennich@google.com>

Nice, it's good to have stuff to point people at.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
