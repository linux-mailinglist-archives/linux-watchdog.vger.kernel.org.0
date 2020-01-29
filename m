Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E632414CF8D
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2020 18:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgA2RWY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jan 2020 12:22:24 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216]:17988 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgA2RWY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jan 2020 12:22:24 -0500
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Jan 2020 12:22:23 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580318542;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:Message-ID:Cc:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=1VqhDXWE4agoMp60ZLl5kMTFU0+HK7qMeOqkwhfAO/U=;
        b=M+Ip3A2mutDvBh3+Wev51iM0feGZWtTW97e6pjXcqcPr6YBqsIVnGrg2JM9j6Q31qT
        tJgzsNVcZfBrIZRk0WwoUSki7xqil0kBXELayZA9jl4n2qdqXrdBtw0cDO2f6w1kbsBR
        2wEOmMmLa1mxYMHh9ThvyHIUBh+QMiQhUWCJnmHz4eD7t6uMeJQn+uGnoAyVdxc2SYwJ
        LyhPX5jKl7lB055DD87OkCW7o4IDsSQgycsLXs13f6rJGWF+mYvIlVm9GSAtzme5C0Yy
        4OFurOEvhUHIhMVnZpaqPob5EUQfq58o0/SS28eNturPbroj4y1HIlPklJpQMiTQF6se
        p9Ww==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/83N2Y0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.1.8 AUTH)
        with ESMTPSA id N0955aw0THGJ0YC
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 29 Jan 2020 18:16:19 +0100 (CET)
Date:   Wed, 29 Jan 2020 18:16:19 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     linux-watchdog@vger.kernel.org
Cc:     wsa@the-dreams.de
Message-ID: <1731064051.261328.1580318179697@webmail.strato.com>
Subject: Best practice when probe fails on armed watchdog?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev25
X-Originating-Client: open-xchange-appsuite
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi!

What is the right thing to do when a watchdog device that has been armed by the bootloader fails to probe? Should the driver

- disable the device and thus save the system from being torn down by a potentially malfunctioning watchdog, at the risk of missing issues further down the line, or
- leave it as is (even though that would most likely result in a reset), hoping that the error is either transient or that there is a mechanism in place outside the kernel that will resolve it?

Is there a best practice for this case?

CU
Uli
