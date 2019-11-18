Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9FD100790
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 15:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKROll (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 09:41:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:54496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbfKROll (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 09:41:41 -0500
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C323206B6;
        Mon, 18 Nov 2019 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574088100;
        bh=XEfRwQZEaHscmy3gbJi0JBpKpBJYrxKvA7I1TzU7u+Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=d3B38qY7dh3iIo+/k9UdBjZPgDm/DI/1HdHxWjmH+9j9XYDzUyw1AWmQFgqsV4ZC2
         HNLcPgUCaew53lIsTfsUy2gmLbVR/Jeg63azqlwbqgGcWzIOPtguc2AYoEXjx4xa0X
         OSoG2X3tDRh4n/FWbJKBBBn9LZcgz+hpEJxVmJ/s=
Date:   Mon, 18 Nov 2019 08:41:39 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Muni Sekhar <munisekharrms@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Subject: Re: watchdog: how to enable?
Message-ID: <20191118144139.GA32448@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118143838.GA29359@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 18, 2019 at 08:38:38AM -0600, Bjorn Helgaas wrote:
> ...
[facepalm, should have read the rest of the thread before cluttering
it, sorry]
