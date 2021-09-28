Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECEFC41A93D
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Sep 2021 09:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239024AbhI1HFG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Sep 2021 03:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbhI1HFG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Sep 2021 03:05:06 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694FAC061575
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Sep 2021 00:03:27 -0700 (PDT)
Date:   Tue, 28 Sep 2021 09:03:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1632812606;
        bh=B5RxoTdlDrwTnftuc4C90Cu911ZumXXVgLIcL9eOIQs=;
        h=Date:From:To:Subject:From;
        b=nb9XfH9NuyACIZlHdFsX0RjKB6cFWoAKp8CDgYplM9nBuLwEr1wgvNjfnRgWbZwMA
         mHhHCMqgYfjcAWI/4aF8xFKmvywsRnb1Q2lVpGv6b7gcGL0eANbGvkF2nDgqGAvQFe
         2U1GMReSBuYtXwIwk9nQfcdetqnhSbetdZKfEoiI=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@weissschuh.net>
To:     linux-watchdog@vger.kernel.org
Subject: Expired TLS certificate for https://linux-watchdog.org
Message-ID: <8b323390-93fd-4f55-8263-79336fc77baf@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

the TLS certificate for https://www.linux-watchdog.org/ expired on 2021-09-18.

Thomas
